# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=ipeek-bin
_pkgname=ipeek
pkgver=0.1.2
pkgrel=1
pkgdesc="Terminal image viewer (Kitty/Sixel/iTerm2/half-blocks) — prebuilt binary"
arch=('x86_64')
url="https://github.com/prietus/peek"
license=('MIT')
depends=('gcc-libs')
optdepends=('ffmpeg: video previews')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('608ac9374a7bbff0f4807cefbd25a5b9ef096ce89b307e167cd08ab817cd2f83')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
