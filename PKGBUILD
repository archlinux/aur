# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=prek
pkgname=${_pkgname}-bin
pkgver=0.2.28
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
            'f6534d485e9cedfa875a375172aff1223d19a2971096e521368484fceb95a6b9'
            '1a5a6b20a64f17ed68c1ddb9fe0a52ef5830e91d8c4a32c77cfb7a68c1a6bd9f'
            '94f51a841460982888a04271a40d5adaaae838d85e53d63ec3e3c0b191751eaf')
sha256sums_x86_64=('75dc8aefe2a7e8965d594fc02aced3dec46606583a399846ce9b5d20afd9b7fb')
sha256sums_i686=('d9b59a82ae039a4c494bda4a65c74a8a8b0eaa0dc9359e9c155b1e77b3ae2f29')
sha256sums_aarch64=('e46d15621188ee89422e6f623af4cebbea9d1b5198edce8f4c4eff96a47abaf5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
