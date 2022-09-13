# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=dateutils
pkgname=python-$_pkgname
pkgver=0.6.12
pkgrel=2
pkgdesc="Utilities for working with datetime objects"
arch=('any')
url="https://github.com/jmcantrell/python-dateutils"
license=('ISC')
depends=('python-dateutil' 'python-pytz')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7633f065542c5550e719622ac72f6f2d67e9b0a6af0d4b0cc13e0b9eab006aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
