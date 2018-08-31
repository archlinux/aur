#Maintainer: <edio@archlinux.us>

pkgname=intelpwm-udev
pkgver=20180831
pkgrel=1
pkgdesc="UDEV rules for setting backlight PWM frequency on Intel HD Graphics"
arch=('i686' 'x86_64')
depends=(intel-gpu-tools)
url="http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html"
license=('GPL')
conflicts=()
install='intelpwm-udev.install'
backup=('etc/intelpwm.conf')
source=(99-intelpwm.rules intelpwm intelpwm.conf)

md5sums=('cc557bd9a9d45f7524713aa4cc0dcaf0'
         '919c1570087304fa8767993f783feb17'
         '940ab594183c24faef6f26e850c12f9c')

build() {
	true
}

package() {
	msg "Installing udev rules and scripts..."
	install -D -m644 "${srcdir}/99-intelpwm.rules" "${pkgdir}/usr/lib/udev/rules.d/99-intelpwm.rules"
	install -D -m644 "${srcdir}/intelpwm.conf" "${pkgdir}/etc/intelpwm.conf"
	install -D -m744 "${srcdir}/intelpwm" "${pkgdir}/usr/bin/intelpwm"
}


