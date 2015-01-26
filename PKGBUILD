# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.22.0
pkgrel=4
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7.9' 'python2-six')
makedepends=('python2-setuptools')

source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('080fa4777857d316a1a179df6523f9b24812db9ef044800050ae3f8a45aaf04fd9f948c776cd11cb6ca4f714a58045bda71b82ed3dd8886f038a89e7334a18a9')

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
