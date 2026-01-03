# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=KarlVM12
_pkgname=dimensions
pkgname=${_pkgname}-bin
pkgdesc="Terminal Tab Manager - Organize your terminal workflows with an interactive TUI"

pkgver=0.2.16
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
            'cd536fe25de4d829eceeebd0a23e3c06345209c8b7cd1c62b400c1a20be0dd14')
sha256sums_x86_64=('b0af0f879366080bed9625eb2bcfd92e0e4391f0b16c4da880a2baf1ebe007ad')
sha256sums_aarch64=('15e55240fdf93358a8a3b01b2c25673acdd452aafa71d241cc620918ea8f6af6')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
