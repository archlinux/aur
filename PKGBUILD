# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/coolbeevip/tui-banner/releases/download/v0.2.2/tui-banner-v0.2.2-x86_64-unknown-linux-gnu.tar.gz

_pkgauthor=coolbeevip
_pkgname=tui-banner
pkgname=${_pkgname}-bin
pkgdesc="Cinematic ANSI banners for Rust CLI/TUI"

pkgver=0.2.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc''gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('87a769addbe4096130098a57a3523ef4584c806646e7db868aea0623e487222c')
sha256sums_aarch64=('00359df26f01ece153759d17280b532d73027aad55da09176e165ee6dbc67d7e')



package() {
	cd "${srcdir}/${_pkgname}-${_pkgvername}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
