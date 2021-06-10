# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=investpy
pkgname=python-$_pkgname
pkgver=1.0.6
pkgrel=1
pkgdesc="Financial Data Extraction from Investing.com with Python"
arch=("x86_64")
url="https://github.com/alvarobartt/investpy"
license=('MIT')
depends=('python-pandas' 'python-unidecode' 'python-lxml' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3ad6dd6a08f2a0177a76c93cf39dce6cbbf8d9ce16ede344f4d27808b2706ac0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
}
