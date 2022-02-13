# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=investpy
pkgname=python-$_pkgname
pkgver=1.0.8
pkgrel=1
pkgdesc="Financial Data Extraction from Investing.com with Python"
arch=("x86_64")
url="https://github.com/alvarobartt/investpy"
license=('MIT')
depends=('python-pandas' 'python-unidecode' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('144db17b02610afabf0567dae8bc7bd30a5269fbd1c192a580a0e41c58ced49b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
