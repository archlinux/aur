# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=prek
pkgname=${_pkgname}-bin
pkgver=0.3.5
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
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}-unknown-linux-gnu.tar.gz")
sha256sums=('08215c44c901c7edf78c3a2b1e02558b0646a3ffa8161be0c112acfd3fb0c100'
            'e4bc7e248d16fff2410972b4d9c3c4217eefa646350bfb05d8cca7bd49ff98a9'
            '0fe799888fbed99f008eb15d70f96a21786b69717660f57f29984f24fd5478a6')
sha256sums_x86_64=('bee1c3f550af004aa4da4441648194e862da629a02361db260fcf5831d4a9bd9')
sha256sums_i686=('c84dd9b0a4a0baff60f009294dd6664b1de0ccc5b349534f7e49b56a118f8cf6')
sha256sums_aarch64=('0c2f41450ba2a902c97061bd3efef6b02b2976f3abcc9134f7900ff8348060ef')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
