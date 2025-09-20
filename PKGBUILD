# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=gman
pkgname=${_pkgname}-bin
pkgver=0.1.0
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
            'd2827b08cd4c5840d05b09f79c26fcc534d51dcc6a34585c0d9edf672fb8bb3d'
            '3e9bba9fca4411bec9b677e87a22dcdbfb84702e46f776636d16d00c0106c855'
            '1567b9c69adab84f053e70eb684b55fa0bc2ad0e1fdd55ab49a71928961ecfe8'
            '2b0481c790707925d0ed9fdc5ba813f6c1ce72fd56a19ac30f151c58504da3df'
            'c27dba4a296182a8c6033dbe563c89b674d830f763c93d82a4cbdc9825ed8662')
sha256sums_x86_64=('38b3f6093798b5b4bc8e2ebf2a264de485a008c4453705b71af29624a1a99745')
sha256sums_aarch64=('993e899e6dbe8357bde68ea2c98527c189bcced671f76bf976398e8f1ba27741')


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
