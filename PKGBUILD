# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jdx
_pkgname=fnox
pkgname=${_pkgname}-bin
pkgver=1.28.0
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
            'f9dff5d36c7eea65994f9131d7a4437d3ed6fa36794dc40674c582f725aec362')
sha256sums_x86_64=('64c0c7dcdf3194137f8f621fb33c65de59c37d8ad473c970dc18273ca039e2b0')
sha256sums_aarch64=('8e465b3ec53cc244ec70e9d7f2a0de5495ed0410cef59c68ed9952e565b8f1ec')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
