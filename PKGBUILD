# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=pypdf
pkgname=python-$_name
pkgver=3.6.0
pkgrel=1
pkgdesc='Python library for manipulating pages of PDF files (v3+)'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
conflicts=("python-pypdf2<1:2.12.1")
makedepends=(python-setuptools python-build python-installer python-wheel python-flit-core)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('944454416d563af8dabc435cc0004fb45820fa580aa8eccf60f7f7a55e492cc6')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
