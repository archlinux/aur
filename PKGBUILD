# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=sound-daemon-phonepi
pkgver=1
pkgrel=4
pkgdesc="Sound control daemon for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("qt5-base" "qt5-tools")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/btn_sound"
	qmake
	make
}

package() {
	cd "$srcdir/Phone/src/btn_sound"
	install -Dm755 "./btn_sound" "$pkgdir/usr/bin/btn_sound"
	install -Dm755 "./btn_sound.service" "$pkgdir/usr/lib/systemd/system/btn_sound.service"
}
