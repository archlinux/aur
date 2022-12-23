# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-pypdf2
pkgver=3.1.0
pkgrel=1
pkgdesc='Python library for splitting, merging, cropping, and transforming pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/PyPDF2"
license=(BSD)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel python-flit-core)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('9c34f31b6a54076b779245f48ce25622a9b70f739c667e5e7bd1e19f207949e7')

build() {
  cd pypdf-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd pypdf-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
