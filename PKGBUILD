# Maintainer: Owen Wang <owenwang2007@icloud.com>
# Maintainer: Joshua Schmid <jxs@posteo.de>
pkgname=gopro-webcam
pkgver=0.0.3
pkgrel=1
pkgdesc="Utility to use a GoPro as a webcam"
arch=("any")
url="https://github.com/NewoIsTaken/gopro_as_webcam_on_linux"
license=("unknown")
depends=("v4l2loopback-dkms" "ffmpeg")
optdepends=("vlc: preview support")
install=gopro-webcam.install
source=("gopro" "gopro_webcam.service" "60-gopro.rules")
noextract=("gopro" "gopro_webcam.service" "60-gopro.rules")
sha256sums=("e1a2b49da464a1c29ac4d339e6d2d32a930b652439f442b414d4912b906c8d66"
            "11352f6a616bed219ee143c65cb5071545638fe1b39e616a15ff698eccab17c4"
            "1b3b896dd0bfaea7987dc03cfc5febcfeea77f0d48619fb3910fa002beb46f02")

package() {
	install -D gopro $pkgdir/usr/bin/gopro
	install -D gopro_webcam.service $pkgdir/usr/lib/systemd/system/gopro_webcam.service
	install -D 60-gopro.rules $pkgdir/lib/udev/rules.d/60-gopro.rules
}
