# Maintainer: Olivier Marty <olivier.marty.m@gmail.com>

pkgname=subtitles-printer-git
pkgver=v1.1.r0.ga4d6108
pkgrel=1
pkgdesc='Shows subtitles in the bottom of an X11 display. Useful with Netflix.'
url='https://github.com/OlivierMarty/SubtitlesPrinter.git'
arch=('any')
license=('GPL2')
depends=('libx11')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/OlivierMarty/SubtitlesPrinter.git')
sha1sums=('SKIP')

provides=("subtitlesPrinter")
conflicts=("subtitlesPrinter")

pkgver() {
	cd "${srcdir}/$pkgname"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/$pkgname"
	make
}

package() {
	cd "${srcdir}/$pkgname"
	install -Dm755 subtitlesPrinter "${pkgdir}/usr/bin/subtitlesPrinter"
}
