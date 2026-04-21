# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=managarr
pkgname=${_pkgname}-bin
pkgver=0.7.2
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
            '2d5f79d46ca677fce6409a9fb96003ad00f5a60817eff2ee3229ca7a9c67c7b2'
            '9877d4a0c6f4ca83161c73edd24c4bdb76c68b7438079a8bff1883f8c69be3db'
            '1567b9c69adab84f053e70eb684b55fa0bc2ad0e1fdd55ab49a71928961ecfe8'
            '3382bae9fd1dddcf04809df91a542f895625494207e9820e2616c5a885f9fbdf'
            '0a587d5756acbc0e9e3377492cae59f21208107470e9dd55baa11db267e6f83f')
sha256sums_x86_64=('b09e114a82968a25278ba7d96b43a3db80e699bb4ef70bf510ef9270bb64faea')
sha256sums_aarch64=('669d09667b9a626b246ad5635564af243cd48d5b6fa05ac4438b1b482f05b566')


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
