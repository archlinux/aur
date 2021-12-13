# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=investpy
pkgname=python-$_pkgname
pkgver=1.0.7
pkgrel=2
pkgdesc="Financial Data Extraction from Investing.com with Python"
arch=("x86_64")
url="https://github.com/alvarobartt/investpy"
license=('MIT')
depends=('python-pandas' 'python-unidecode' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e8146d2308a8474cf494782bc14e08e536d4da51153b8907a396b6cfb73a167')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
