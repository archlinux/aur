# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=prek
pkgname=${_pkgname}-bin
pkgver=0.2.25
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="⚡ Better 'pre-commit', re-engineered in Rust"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}-unknown-linux-gnu.tar.gz")
sha256sums=('08215c44c901c7edf78c3a2b1e02558b0646a3ffa8161be0c112acfd3fb0c100'
            '1220b19cf3614e65cdef821fd4edc31a2e422534cbb5bdbe20009e19342a9216'
            '1a5a6b20a64f17ed68c1ddb9fe0a52ef5830e91d8c4a32c77cfb7a68c1a6bd9f'
            '68925406996e3cb333e622b4f5b30fdc08f49d998f075de8244eb10d0dc75151')
sha256sums_x86_64=('7befd9d97b19155b4a3f91ecb33ad39c67bbcba7ac0217ddae9077389c227fcc')
sha256sums_i686=('a39a95e51f3953fa1d0cb1b8b9fb78e67d1f03005dc49cd508e51f7746360977')
sha256sums_aarch64=('4a496c30639435c7a6a12f99fccd38ce2aed81133469dab0330b31ea80ed1a4b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
