# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.14.1
pkgrel=3
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7' 'python2-backports.ssl_match_hostname' 'python2-six')

makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('5efb6fdef3560d546aadeadecd4a3f26b08af2086381d92c36b66e956c6ca581187afba8c892fe637483dc1590053c8a7989722f93557d8bd0701560bf980120')

build() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s|env python|env python2|' {} \;
}


# vim:ts=2:sw=2:et
