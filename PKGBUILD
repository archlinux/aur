#Maintainer: <edio@archlinux.us>

pkgname=intelpwm-udev
pkgver=20170301
pkgrel=1
pkgdesc="UDEV rules for setting backlight PWM frequency on Intel HD Graphics"
arch=('i686' 'x86_64')
depends=(intel-gpu-tools)
url="http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html"
license=('GPL')
conflicts=()
install='intelpwm-udev.install'
source=(99-intelpwm.rules intelpwm intelpwm.conf)

md5sums=('cc557bd9a9d45f7524713aa4cc0dcaf0'
         '8307210b9aba977e7345b0f8710b049e'
         'a76d4da1e2071169dafd0b66e47424d6')

build() {
	  true
}

package() {
	msg "Installing udev rules and scripts..."
	install -D -m644 "${srcdir}/99-intelpwm.rules" "${pkgdir}/usr/lib/udev/rules.d/99-intelpwm.rules"
	install -D -m644 "${srcdir}/intelpwm.conf" "${pkgdir}/etc/intelpwm.conf"
	install -D -m744 "${srcdir}/intelpwm" "${pkgdir}/usr/bin/intelpwm"
}


