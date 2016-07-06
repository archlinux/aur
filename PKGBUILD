# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=felony
pkgver=0.10.3
pkgrel=1
pkgdesc="%%SOME DESCRIPTION HERE%%"
arch=('x86_64')
url="%%SOME URL HERE%%"
license=('%%SOME LICENSE(S) HERE%%')
install=
changelog=
noextract=()
#depends=('%%RUNTIME DEPENDENCIES HERE%%')
#optdepends=('%%OPTIONAL DEPENDENCIES HERE (pkg: why needed)%%')
#makedepends=('%%BUILDTIME DEPENDENCIES HERE%%')
_pkgname=Felony
#_pkgname2='%%OPTIONAL SHORTHAND PACKAGE NAME%%'
source=("https://github.com/henryboldi/felony/releases/download/0.10.3/${_pkgname}-linux-${pkgver}-x64.zip"
	"${_pkgname}-linux-${pkgver}-x64.zip.sig")
sha512sums=('b4f8539956f0adfe0281e2d38ff8795ee23847035b8bbb775c856f3eaf802b39ee5da78c1e44c2e30cd9d64e3d8e7f7ef44e895b44e1a5afdc5b8f47604ef5fe'
            'SKIP')
provides=("${_pkgname}")
#conflicts=("${_pkgname}")

build() {
	cd "${srcdir}/${_pkgname}/src"
	make prefix=${pkgdir}/usr
}

package() {
	install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname2} ${pkgdir}/usr/bin/${_pkgname2}
	install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
