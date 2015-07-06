#Maintainer: <edio@archlinux.us>

pkgname=intelpwm-udev
pkgver=20140803
pkgrel=1
pkgdesc="UDEV rules for setting backlight PWM frequency on Intel HD Graphics"
arch=('i686' 'x86_64')
depends=(intel-gpu-tools)
url="http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html"
license=('GPL')
conflicts=()
install='intelpwm-udev.install'
source=(99-intelpwm.rules intelpwm intelpwm.conf)

md5sums=('91af4fa0f8ac47a32ce2a8a19f54c83d'
         '377f00bc31757789efa145125caee56d'
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


