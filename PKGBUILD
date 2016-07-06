# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=npm-cross-env
pkgver=1.0.8
pkgrel=2
pkgdesc="Run commands that set environment variables across platforms"
arch=('i686' 'x86_64')
url="https://github.com/kentcdodds/cross-env"
license=('MIT')
install=
changelog=
noextract=("${_pkgname}-${pkgver}.tgz")
depends=('npm')
#optdepends=('%%OPTIONAL DEPENDENCIES HERE (pkg: why needed)%%')
#makedepends=('%%BUILDTIME DEPENDENCIES HERE%%')
_pkgname=cross-env
#_pkgname2='%%OPTIONAL SHORTHAND PACKAGE NAME%%'
source=("http://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
	"${_pkgname}-${pkgver}.tgz.sig")
sha512sums=('c21d11c37a03014a327f98a287407db6a2a18177039d6717540ea7ccd8f0c30b735a4b638ca46f2fa5b18da25ef4b5f73c918c30efa3b653966b01e7e30bc94e'
            'SKIP')
provides=("${_pkgname}")
#conflicts=("${_pkgname}")

package() {

	cd "${srcdir}"
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "${_npmdir}"
	cd "${_npmdir}"
	npm install -g --prefix "${pkgdir}/usr" ${_pkgname}@${_npmver}

}
