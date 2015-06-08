# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=0.7
pkgrel=1
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
depends=('python2-stem-git' 'python2-flask')
optdepends=('python2-pyqt4: to run onionshare-gui' 'tor-browser-en: before you can share a file, you need to open Tor Browser')
source=(https://github.com/micahflee/onionshare/archive/$pkgver.tar.gz)
sha512sums=('b9d5de8b54355e7694738c5d6a66213ca3b54621045bcde42b92f53d3527acb22408ecd52bb058b4b0e90392c05ab7303f3575c17943f1f331760e2a8dbea428')

package() {
	cd "$srcdir/onionshare-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/"
	install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/"
	chmod +x $pkgdir/usr/bin/onionshare $pkgdir/usr/bin/onionshare-gui
}

# vim:set ts=2 sw=2 et:
