# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=abeep-git
pkgrel=2
pkgver=r20.01c63c8
pkgdesc='Just like beep, except that it plays via ALSA'
arch=('x86_64')
url='https://github.com/Hawk777/abeep'
license=('GPL2')
depends=('alsa-lib')
source=("${pkgname}"::'git+https://github.com/Hawk777/abeep.git')
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -D -m0755 abeep ${pkgdir}/usr/bin/abeep
}
