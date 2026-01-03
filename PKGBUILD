# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=KarlVM12
_pkgname=dimensions
pkgname=${_pkgname}-bin
pkgdesc="Terminal Tab Manager - Organize your terminal workflows with an interactive TUI"

pkgver=0.2.13
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md" "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('a534a04ad2f05eb242287a2accf35c554ddaed79e47d1a5c4c370a6821c8e69e'
            '73737e484d71d6d9c4f35dddb5861d11f99a37af3bed2f1e2b0015d4bcbd934a')
sha256sums_x86_64=('de1087ffc4b4662abad0b01aea6f4b5edde987c9256543c06f52f1323f2104db')
sha256sums_aarch64=('af664aa5188b45e21ce3222e58fc41b9d8fb226f306bd7ccc1eedf08e0990f7c')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
