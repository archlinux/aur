# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=gman
pkgname=${_pkgname}-bin
pkgver=0.2.3
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
            '9aef8110cd1780490f093e3190f10e557fedd5d05b9d77a52a17445505e7ea8a'
            '27d87c1eb64524acac0fc41e39989533357bbb623268267653cd9ac06f675790'
            'b1c4b6167087a6c3ce10ba87de339dbf4e0e04acd65533e8491870b0fbd1b57f'
            '2b0481c790707925d0ed9fdc5ba813f6c1ce72fd56a19ac30f151c58504da3df'
            'c27dba4a296182a8c6033dbe563c89b674d830f763c93d82a4cbdc9825ed8662')
sha256sums_x86_64=('a68366a07740f851b7e42240c820c41edcc3a2a6d038e81cb6b6bb4b61974b46')
sha256sums_aarch64=('787f2e96fca8c949eda8dd7e240f6044358aaf3b22c1e1b6a7c32338d95a9134')


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
