# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=socketIO-client
pkgname=python2-socketio-client
pkgver=0.7.0
pkgrel=1
pkgdesc="Here is a socket.io client library for Python. You can use it to write test code for your socket.io server."
arch=('any')
url="https://github.com/invisibleroads/socketIO-client"
license=('MIT')
depends=('python2' 'python2-requests>=2.7.0' 'python2-six' 'python2-websocket-client')
makedepends=('python2-setuptools')
provides=('python2-socketio-client')
source=("https://github.com/invisibleroads/socketIO-client/archive/$pkgver.tar.gz" "LICENSE")
md5sums=('04ff6321fb99a1bad6ac2a404221bf53'
         'd254476822e464804f51bea272ee2588')
sha1sums=('21266138aa9e5818f1523ea82c2e5a7340161f79'
          'b0bb5933cb4d295afd99aab68530e7fb833b7466')
sha256sums=('08d0adfcbbc4e6032df94a1f8fb816ba9c7fdeb8f1159ce9955d130ea928cfd5'
            '38b188b11ce988f3c4ba92b4ecbbf83af5a0b10a54f9862fdeb015fd42344106')
sha512sums=('a79d19412e3c71f6678af019f21d678a5c4d8c13e2498a3df73b96c27fe258cd9f51aeccf0dfe03b4833a3daf1fbdf17c8e5d264f03e792acba4060e572bc14d'
            '97f6062f950e1753821326b8e6a656c8e3c06906dcec39cc8118fdf39ff15183488822734abdbf8447cc1e4c4862ac180df507192fb8a17743cdc01bfd76ca10')
            
package() {
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "$srcdir/$_name-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}


