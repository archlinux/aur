# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=mitmproxy-git
pkgver=3.0.1.r246.a4a48a96
pkgrel=1
pkgdesc="An interactive TLS-capable intercepting HTTP proxy for penetration testers and software developers"
arch=('any')
url="https://mitmproxy.org/"
license=('MIT')
depends=('openssl' 'python2-urwid' 'python2-pyopenssl' 'python2-pyasn1' 'python2-imaging' 'python2-lxml' 'python2-flask' 'python2-requests' 'python2-passlib' 'python2-configargparse' 'python2-tornado' 'python2-blinker>=1.3' 'python2-pyperclip>=1.5.8' 'python2-wsproto')
conflicts=('mitmproxy')
provides=('mitmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/mitmproxy"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  cd "$srcdir/mitmproxy"
  python2 setup.py install --root=$pkgdir || return 1
}
