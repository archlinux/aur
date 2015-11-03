# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=hangupsbot
pkgver=1.7.0
pkgrel=1
pkgdesc="Bot for Google Hangouts"
arch=('any')
url="https://github.com/xmikos/hangupsbot"
license=('GPL3')
depends=('hangups-git' 'python-appdirs')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/hangupsbot/archive/v$pkgver.tar.gz)
md5sums=('d7d423eceb039ed43e8900aa6dfa4f3e')

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
