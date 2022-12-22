# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=3.0.0
pkgrel=1
pkgdesc='Python library for splitting, merging, cropping, and transforming pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel python-flit-core)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('25952ff26f08213d9e8aeb22543bef909ba2a5defe28942dd281881e76cc6630')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
