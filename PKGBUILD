# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=fnox
pkgname=${_pkgname}-bin
pkgver=1.9.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Fort Knox for your secrets"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('a978dbd843845fb958044bc384c1826bd9cb5e64ea540c392fa410a288de9df4'
            '3fa941e2b40e3e8017f6548dc5a3db235e7522ef3b0a6d5afd60e88046567c52')
sha256sums_x86_64=('25f7487f0dec869179a092fe247d4db62afd34155fc90037cd9ad93cad295307')
sha256sums_aarch64=('b929e27de5432a8ec13dda76d6b8c7aadf2b69f5687174f8cf5640c8e9793664')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
