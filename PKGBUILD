# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=felony
pkgver=0.10.3
pkgrel=2
pkgdesc="An open-source pgp keychain built on the modern web with Electron, React, and Redux"
arch=('x86_64')
url="https://github.com/henryboldi/felony"
license=('MIT')
install=
changelog=
noextract=()
depends=('npm' 'npm-cross-env')
#optdepends=('%%OPTIONAL DEPENDENCIES HERE (pkg: why needed)%%')
#makedepends=('%%BUILDTIME DEPENDENCIES HERE%%')
_pkgname=Felony
#_pkgname2='%%OPTIONAL SHORTHAND PACKAGE NAME%%'
# alternative source? distributed .zip: https://github.com/henryboldi/felony/releases/download/0.10.3/Felony-linux-0.10.3-x64.zip
source=("https://github.com/henryboldi/${pkgname}/archive/${pkgver}.tar.gz"
	"${pkgver}.tar.gz.sig")
sha512sums=('8819ab21635a4502ceb178d76992b15afea2cc738b8b1633249d338d9e0799d16f7bd5a5c74ee320c9fa3399d28900437f8a42e9a2f4496b6d004dd8f7707ea3'
            'SKIP')
#conflicts=("${_pkgname}")

package() {

	cd "$srcdir"
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "${_npmdir}"
	cd "${_npmdir}"
	npm install -g --prefix "${pkgdir}/usr" ${_pkgname}@${_npmver}

}
