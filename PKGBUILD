# Maintainer: Derek Enlow <derekenlow@gmail.com>
_pkgname="instawow"
pkgname="${_pkgname}-bin"
pkgver=7.0.0.post1
pkgrel=1
epoch=
pkgdesc="A CLI add-on manager for World of Warcraft."
arch=('x86_64')
url="https://github.com/layday/${_pkgname}"
license=('GPL')
depends=()
makedepends=("unzip")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
changelog=
source=(
	"${_pkgname}-${pkgver}-LICENSE.md::https://raw.githubusercontent.com/layday/${_pkgname}/refs/tags/v${pkgver}/COPYING"
)
source_x86_64=(
	"${_pkgname}-${pkgver}-${CARCH}.zip::https://github.com/layday/instawow/releases/download/v${pkgver}/${_pkgname}-cli-${pkgver}-${CARCH}-unknown-linux-gnu.zip"
)
noextract=(
	"${_pkgname}-${pkgver}-${CARCH}.zip"
)
sha256sums=('SKIP')
sha256sums_x86_64=('6850abf948ebaf022c3c3cba337103cf2e2e8dc0a0377ba715564fc4b835dc9f')

prepare() {
	cd "${srcdir}"
	unzip -j "${_pkgname}-${pkgver}-${CARCH}.zip"
}

package() {
	cd "${srcdir}"
	install -vDm644 "${_pkgname}-${pkgver}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
