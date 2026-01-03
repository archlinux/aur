# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=KarlVM12
_pkgname=dimensions
pkgname=${_pkgname}-bin
pkgdesc="Terminal Tab Manager - Organize your terminal workflows with an interactive TUI"

pkgver=0.2.14
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
sha256sums=('601106ec230e339989c3eabb474fab35ea66274063e387b00540e943c7700e83'
            'df82357d0fc184d202eafe9dc0d7b17df28a71fb21d2b83858266b00e2c11c61')
sha256sums_x86_64=('2468e4dfee4ed43a8f770cc96beea03cd5565c06687c0421cc31b2a8c21c5a67')
sha256sums_aarch64=('a157350a5339ac340861ccea65d2a2ae9e0421ec60f6026eb68a0170756a4dbb')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
