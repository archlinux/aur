# Original Script for python2 version: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=0.18.0
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=(any)
url="https://github.com/liris/websocket-client"
license=('LGPL')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz
        tests-package.patch)
sha512sums=('5524271067fd3b89ddbe3ab6cdb2491a1387a54ff569b043a1daffe8b50b0c470c9b6c2671b3d77f2b6261e4125e753410eed818f492e2669df2a84c92bf805a'
            '88f22fac7ad4a333288cd4e2159feada02500b8d3624ef1bc9256a1705d6e03023aee1d5d03330c521dbfe0b2ac4549e49bb6e65ff0b8eeab43c1e01b163e6bc')

prepare() {
  cd "$srcdir/websocket-client-$pkgver"
  patch -p0 -i "$srcdir/tests-package.patch"
}

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
