# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_name=websocket_client
pkgname=python2-websocket-client
pkgver=0.59.0
pkgrel=1
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7.9' 'python2-six')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/_/-}-$pkgver.tar.gz")
md5sums=('19ccf9abcd151b30975e7b52bfd02760')

build() {
  cd "$srcdir/${_name/_/-}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${_name/_/-}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir/usr/bin/wsdump.py"  # provided by python3 package
}

# vim: ts=2 sts=2 sw=2 et ft=sh
