# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-oslo-utils
pkgver=6.0.1
pkgrel=1
pkgdesc="Oslo Utility library"
arch=('any')
url="https://pypi.python.org/pypi/oslo.utils/$pkgver"
license=('Apache')
depends=('python38-iso8601' 'python38-oslo-i18n' 'python38-pytz' 'python38-netaddr'
         'python38-netifaces' 'python38-debtcollector' 'python38-pyparsing' 'python38-packaging')
makedepends=('python38-setuptools')
checkdepends=('python38-oslotest' 'python38-ddt' 'python38-eventlet')
source=("https://github.com/openstack/oslo.utils/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c5835286f2b56561d9f1b41719fd68d669c3a4379adc7ef77da5a2c92a6ca8e5fbdbfcba5c3eb1763ce251bde33e6ff100e61dca4a3de34f1198d531ff81f608')

export PBR_VERSION=$pkgver

build() {
  cd oslo.utils-$pkgver
  python3.8 setup.py build
}

check() {
  cd oslo.utils-$pkgver
  stestr run
}

package() {
  cd oslo.utils-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
