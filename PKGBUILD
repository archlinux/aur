#Maintainer: carrothu <hrxcn@126.com>
#Maintainer: Nikita Tarasov <nikatar@disroot.org>

pkgname=intelpwm
pkgver=1.1
pkgrel=1
pkgdesc="PWM frequency setting on Intel HD Graphics with modprobe.d"
arch=(x86_64)
depends=(intel-gpu-tools)
url="https://127001.me/post/eliminate-backlight-flicker-with-i915/"
license=(GPL)
conflicts=()
install='intelpwm.install'
backup=('etc/intelpwm.conf')
source=(i915-pwm.conf intelpwm intelpwm.conf)

sha256sums=('f25b883744dbe177d0ec7efaca17ffb288f4a7994e819883f299c90c27295f85'
            '3c17d61d623086f05cadfb28eea2d0915942509527b5d4e67ffa309ee13304b7'
            'e16a943287e3104dc8869651f00f75281abf78dd20e3e601404f8bd4f7bbbdc5')

build() {
	true
}

package() {
	echo "Installing..."
	install -D -m644 "${srcdir}/i915-pwm.conf" "${pkgdir}/etc/modprobe.d/i915-pwm.conf"
	install -D -m644 "${srcdir}/intelpwm.conf" "${pkgdir}/etc/intelpwm.conf"
	install -D -m744 "${srcdir}/intelpwm" "${pkgdir}/usr/bin/intelpwm"
}


