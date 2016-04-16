# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=cx23885-firmware
pkgver=2016.04.16
pkgrel=1
pkgdesc="Hauppauge hvr1800 tv-tuner card firmware."
arch=('any')
url="http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructure/46978"
license=('custom')
depends=('linux-firmware')
source=('http://steventoth.net/linux/hvr1800/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip'
	'http://steventoth.net/linux/hvr1800/extract.sh'
	'http://steventoth.net/linux/hvr1800/readme.txt')
sha256sums=('ccbe3bc8b8545ecf00cf3fc47af1b33f312a6f2e873a3e29ce1e8b82adef49d9'
	'8c231e54c08920b144df44017db111835c557fca7c4082c412eb6fa9d413be5a'
	'b6d27d2e6c6d1101556ede4539d672ba6b780462a171a2f9f445a09107228285')

package() {
	_systemdbasedir="$pkgdir/usr/lib/firmware"
	
	cd "$srcdir"
	sh extract.sh
	install -Dm644 v4l-cx23885-enc.fw "$_systemdbasedir/v4l-cx23885-enc.fw"
	
	# The below file is owned by the package linux-firmware and so should not be extracted
	# install -Dm644 v4l-cx23885-avcore-01.fw "$_systemdbasedir/v4l-cx23885-avcore-01.fw"
	}
