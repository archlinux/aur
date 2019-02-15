# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-dateparser
pkgver=0.7.1
pkgrel=1
pkgdesc="python parser for human readable dates"
url="https://github.com/scrapinghub/dateparser"
arch=('any')
license=('custom:bsd')
depends=('python-dateutil' 'python-regex' 'python-tzlocal' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("${pkgname#python-}-$pkgver.tar.gz::https://github.com/scrapinghub/dateparser/archive/v$pkgver.tar.gz")
sha256sums=('dc0d12f06f02e9fc1ee83e99e20c0c7e2b7da3acfae61b43f43fa20bbdbf0032')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
