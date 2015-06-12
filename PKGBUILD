pkgname=alsa-tray
pkgver=0.6
pkgrel=2
pkgdesc="A systray icon and a command line interface for setting the volume of the ALSA Mixers."
arch=('any')
url="http://software.flogisoft.com/$pkgname/en/"
license=('GPL3')
depends=('alsa-lib' 'python2' 'pygtk' 'python2-pyalsaaudio')
source=("http://projects.flogisoft.com/$pkgname/download/${pkgname}_${pkgver}_src.tar.gz")
md5sums=('59038e18afa94bcf08dc3bec3f19f23a')

build () {
	cd "$pkgname-$pkgver"
	# modify the shebang line to force the use of /usr/bin/python2
	# instead of /usr/bin/python
	sed -e '1 s/$/2/' -i code/alsa_tray.py
}

package() {
	cd "$pkgname-$pkgver"
	./install.sh --package "$pkgdir/"
}

# vim: set ft=sh ts=4 sw=4 noet:
