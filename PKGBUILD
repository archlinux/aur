# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=gradel
pkgver=0.12.2
pkgrel=1
pkgdesc="A gradebook program for teachers"
arch=("i686" "x86_64")
url="http://gradel.sourceforge.net/"
license=("GPL")
depends=("gambas2-runtime" "gambas2-gb-qt" "gambas2-gb-qt-ext" "gambas2-gb-form" "gambas2-gb-net" "gambas2-gb-net-curl")
makedepends=("gambas2-devel")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}/

	# Variables
	export DESTDIR="${pkgdir}"

	sh ./compile.sh
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}/

	sh ./install.sh

	# Desktop
	install -D ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}

sha1sums=('ad3ae11636137961052ace908e85049b6c578072')
