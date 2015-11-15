# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=hangupsbot
pkgver=1.7.1
pkgrel=1
pkgdesc="Bot for Google Hangouts"
arch=('any')
url="https://github.com/xmikos/hangupsbot"
license=('GPL3')
depends=('hangups-git' 'python-appdirs')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/hangupsbot/archive/v$pkgver.tar.gz)
sha256sums=('5c0cda30ef0b556d04b91fed1c17a5d170bc556bb23b0c960b301224272b5565')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^.*asyncio.*$//' setup.py
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
