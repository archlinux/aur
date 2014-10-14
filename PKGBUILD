# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.20.0
pkgrel=1
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7' 'python2-backports.ssl_match_hostname' 'python2-six')

makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('74a970cf8391b70a61e07887d86eadf3c85a44d6e6877975a7135992e878ff56a1110eef63ea9a4f4b3513cfad109c954c4bcd77c68f741bffd569367f10cfe9')

build() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir/usr/bin/wsdump.py"  # provided by python3 package
}

# vim: ts=2 sts=2 sw=2 et ft=sh
