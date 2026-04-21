# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=loki
pkgname=${_pkgname}-ai-bin
pkgver=0.3.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="An all-in-one, batteries included LLM CLI tool"
arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

optdepends=('jira')
depends=('jq' 'usql' 'uv' 'docker')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('16d0b134f225596b5046ab790bcf7b516039826c01dce6b92f3e404c5eabfa3d'
            '082d0086f0eb944fb6dae0624ba98da526f201feb1536640dd73c0978c938dad'
            'bc71e0b2d4e7ec3110be5c2556d001f5e6ead5282c8df819fcef9bf9d6a88682'
            'b1c4b6167087a6c3ce10ba87de339dbf4e0e04acd65533e8491870b0fbd1b57f'
            '571861178130b8349363afb29c1afab4a6d54cbe5ff5ea73c2f7299e58bb9a0b'
            'c27dba4a296182a8c6033dbe563c89b674d830f763c93d82a4cbdc9825ed8662')
sha256sums_x86_64=('51374a308d0b587ec2f4f1649c4e74ea4ea40bd5157bdbe339312091a6f4be97')
sha256sums_aarch64=('977f7ba34bd8f14b1c8705996348fd8b71aa2df24cda6739c686820898fd52e8')


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
