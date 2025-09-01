# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenshaw
_pkgname=fv
pkgname=${_pkgname}-cli-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="A command-line font viewer using terminal graphics (Sixel, iTerm, Kitty)"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.bz2")
sha256sums=('6eb277fec0697370fd521e045b161b705857440545f7da357d191316934d68d1')
sha256sums_x86_64=('b453541c2f584b8875ee88a9c56ba1db941a615cef266120c85c22fef1cb690f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
