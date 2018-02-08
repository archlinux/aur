# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-dateparser
pkgver=0.7.0
pkgrel=1
pkgdesc="python parser for human readable dates"
url="https://github.com/scrapinghub/dateparser"
arch=('any')
license=('custom:bsd')
depends=('python-dateutil' 'python-regex' 'python-tzlocal' 'python-ruamel-yaml')
source=("${pkgname#python-}-$pkgver.tar.gz::https://github.com/scrapinghub/dateparser/archive/v$pkgver.tar.gz")
sha256sums=('36831f3ec63eebd7e472796c569d12fb6c6fd6dcd03aa447f5a4e8ab762cf4e0')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
