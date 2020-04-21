#Maintainer: Nikita Tarasov <nikatar@disroot.org>

pkgname=intelpwm
pkgver=1.0
pkgrel=1
pkgdesc="PWM frequency setting on Intel HD Graphics with modprobe.d"
arch=(x86_64)
depends=(intel-gpu-tools)
url="http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html"
license=(GPL)
conflicts=()
install='intelpwm.install'
backup=('etc/intelpwm.conf')
source=(i915-pwm.conf intelpwm intelpwm.conf)

sha256sums=('f25b883744dbe177d0ec7efaca17ffb288f4a7994e819883f299c90c27295f85'
            '51f14a522767ff4c803ac1149980715714966356e36ed1e92cf61110a35bf784'
            '7fefe55b66278e97eaca2fdf0aad125720cd00c95069dc38ef02ae1ee4e846b0')

build() {
	true
}

package() {
	msg "Installing..."
	install -D -m644 "${srcdir}/i915-pwm.conf" "${pkgdir}/etc/modprobe.d/i915-pwm.conf"
	install -D -m644 "${srcdir}/intelpwm.conf" "${pkgdir}/etc/intelpwm.conf"
	install -D -m744 "${srcdir}/intelpwm" "${pkgdir}/usr/bin/intelpwm"
}


