# Maintainer: Yishen Miao <mys721tx@gmail.com>

pkgname=raspi-gpio-git
pkgver=r40.d2159a3
pkgrel=1
pkgdesc='Raspberry Pi GPIO informaion utility, latest git version'
arch=('armv6h' 'armv7h' 'aarch64')
url='https://github.com/RPi-Distro/raspi-gpio'
license=('BSD')
source=("git+https://github.com/RPi-Distro/raspi-gpio.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/raspi-gpio"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/raspi-gpio"

	./configure --prefix=/usr

	make
}

package() {
	cd "${srcdir}/raspi-gpio"

	install -Dm755 raspi-gpio "${pkgdir}/usr/bin/raspi-gpio"
}
