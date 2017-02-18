# Maintainer: Oskar Sveinsen

_pkgname=ndless-luna
pkgname=ndless-luna-git
pkgver=2.0.r0.g2a253d5
pkgrel=1
pkgdesc="Pack Lua programs and XML problems as TNS files for use on the TI-Nspire calculator series"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ndless-nspire/Luna"
license=('MPL')
groups=()
depends=('zlib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("${_pkgname}"::'git+https://github.com/ndless-nspire/Luna.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX="${pkgdir}/usr/bin" install
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}
