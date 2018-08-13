# Maintainer: Dmitry Lavnikevich <haff@midgard.by>

pkgname=themerrr
pkgver=1.1.1
pkgrel=1
pkgdesc="Dynamic system theme rereader"
arch=('i686' 'x86_64')
url="https://github.com/githaff/themerrr"
license=('GPL2')
depends=('glibc' 'libx11')
makedepends=('git' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/githaff/themerrr.git#tag=v${pkgver}")
md5sums=('SKIP')


build() {
	mkdir -p "${srcdir}/${pkgname}"
	cd "${srcdir}/${pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release "../${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
