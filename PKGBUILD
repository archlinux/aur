# Maintainer: Simon Hanna <simon dot hanna at serve-me dot info>
pkgname=onionshare
pkgver=0.7.1
pkgrel=1
pkgdesc="Lets you securely and anonymously share a file of any size with someone"
url="https://github.com/micahflee/onionshare"
arch=('any')
license=('GPL3')
depends=('python2-stem-git' 'python2-flask')
optdepends=('python2-pyqt4: to run onionshare-gui' 'tor-browser-en: before you can share a file, you need to open Tor Browser')
source=(https://github.com/micahflee/onionshare/archive/$pkgver.tar.gz)
sha512sums=('189590422d0ad6642bbf5951a2b4017d35f25900139360cee0f4560f76d42f4e61df13493c80e4b96f5cd00b4ccdd0f51e41cfcb2fb3009753dd87a67d5d7be8')

package() {
	cd "$srcdir/onionshare-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -D -m 644 install/onionshare.desktop "${pkgdir}/usr/share/applications/"
	install -D -m 644 install/onionshare80.xpm "${pkgdir}/usr/share/pixmaps/"
	chmod +x $pkgdir/usr/bin/onionshare $pkgdir/usr/bin/onionshare-gui
}

# vim:set ts=2 sw=2 et:
