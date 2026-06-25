# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=managarr
pkgname=${_pkgname}-bin
pkgver=0.7.3
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A TUI and CLI for managing *arr servers"
arch=('x86_64' 'aarch64')
_barch=('linux-musl' 'aarch64-gnu')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('LicenseRef-Managarr')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('fe07b0be3b1da93a987db6ac910f0f01b2c64c46e74e13307737f7741ec26e5c'
            '427cff8fcc0767f92f344b05a33bc348fe3eb3364469e686457555396b3b5209'
            'fbbc72643ab6836a8e5ebd188b961cb4a35f7acec350630c3ab6b08383ecbf4a'
            '1567b9c69adab84f053e70eb684b55fa0bc2ad0e1fdd55ab49a71928961ecfe8'
            '3382bae9fd1dddcf04809df91a542f895625494207e9820e2616c5a885f9fbdf'
            '0a587d5756acbc0e9e3377492cae59f21208107470e9dd55baa11db267e6f83f')
sha256sums_x86_64=('27c2a5ab4b69c59c544629568e058387eeee31ed4b0048f058abbcde3ce1bcfd')
sha256sums_aarch64=('ac1bb6b8b3b6efc9c3e93b5832837b6b5d75c2c1084ede362a023536300b839d')


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
