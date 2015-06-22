# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=hangupsbot
pkgver=1.6.0
pkgrel=1
pkgdesc="Bot for Google Hangouts"
arch=('any')
url="https://github.com/xmikos/hangupsbot"
license=('GPL3')
depends=('hangups-git' 'python-appdirs')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/hangupsbot/archive/v$pkgver.tar.gz)
md5sums=('a24f235372037b1243920d0f33b3f8e7')

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
