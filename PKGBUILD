# Maintainer: Martin Rys <rys.rs/contact>
pkgname=aax-bruteforce
pkgver=1.0.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='Bruteforce decrypt key for AAX files.'
arch=('x86_64' 'aarch64')
url='https://github.com/MaxMatti/aax-bruteforce/'
license=('GPL-3.0-only')
groups=()
depends=('gcc-libs')
makedepends=('clang')
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MaxMatti/${pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
noextract=()
sha256sums=('bb346d436e3737f9cbf6a2e145b9b6e7d7ac2f367c9e18ca1b4fc362d3e50513')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 'main' "${pkgdir}/usr/bin/${pkgname}"
}
