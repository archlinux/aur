# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Towtow10

pkgname=ascii-patrol
_pkgname=asciipat
pkgver=1.7
pkgrel=1
pkgdesc='Terminal Moon Control clone.'
arch=('x86_64')
url='http://ascii-patrol.com/'
license=('GPL')
optdepends=('libxi: to fix problems with no keyboard input in a few GNOME terminals'
            'curl: for highscores table support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/msokalski/ascii-patrol/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2e19c0816f74ce4502ed31b498ac586d4553f5a84fb55b0f003bae434004a148')

prepare() {
	cd ${pkgname}-${pkgver}
	chmod +x build.sh
}

build() {
	cd ${pkgname}-${pkgver}
	./build.sh
}

package() {
	cd ${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/bin/
	install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
