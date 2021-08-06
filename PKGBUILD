# Maintainer: Owen Wang <owenwang2007@icloud.com>
# Maintainer: Joshua Schmid <jxs@posteo.de>
pkgname=gopro-webcam
pkgver=0.0.3
pkgrel=1
pkgdesc="Utility to use a GoPro as a webcam"
arch=("any")
url="https://github.com/NewoIsTaken/gopro-webcam"
license=("Apache")
depends=("v4l2loopback-dkms" "ffmpeg")
optdepends=("vlc: preview support")
install=gopro-webcam.install
source=("gopro" "gopro_webcam.service" "60-gopro.rules")
noextract=("gopro" "gopro_webcam.service" "60-gopro.rules")
sha256sums=("fcf5de75c567d6aba5c29521661476419ca61f5540f33efc04a4f97a1166df75"
            "5f6d0005d9790b4fa03107f83790c23948f34c887790e26d25dc7ed9e5ff2fae"
            "76f247506012177858323eeadfca859ba4b9abbe832181ac0c178c8aac0a3c9c")

package() {
	install -D gopro $pkgdir/usr/bin/gopro
	install -D gopro_webcam.service $pkgdir/usr/lib/systemd/system/gopro_webcam.service
	install -D 60-gopro.rules $pkgdir/usr/lib/udev/rules.d/60-gopro.rules
}
