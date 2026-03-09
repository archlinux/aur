# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=gman
pkgname=${_pkgname}-bin
pkgver=0.4.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Universal command line credential management and injection tool"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('d8de70bc004d0740466df51f22845647ca8a104c15386fd1411d580a43e12257'
            'abf6b6c5b7042317843c48ee1338eb59afcf2a92c4c163ca6cd98983786b7403'
            '925e892aefc1c8f94461d9ea437b812a2560ef0b6c1e4c65c720b0d7acf77573'
            'b1c4b6167087a6c3ce10ba87de339dbf4e0e04acd65533e8491870b0fbd1b57f'
            'e254d8e4dbaef650c1ed48c16df3da43a0633d240f0a763b295b32d2959f48ec'
            'c27dba4a296182a8c6033dbe563c89b674d830f763c93d82a4cbdc9825ed8662')
sha256sums_x86_64=('6332eac2572d09ae9ec380bec1cf21ff80a89b35f4b998b7091866a22821bf57')
sha256sums_aarch64=('cc9ec6005557c4e449b68788ded0f14c30ebe8c75bd2a344e56f11a41ca86465')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
