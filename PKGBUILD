# Maintainer: fk29g <fk29g.uphill912@slmails.com>
# Previous-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Previous-Maintainer: dmadisetti <madisetti at pm dot me>
# Previous-Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

_pkgname=steam-tui
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Rust TUI client for steamcmd"
arch=('x86_64')
url="https://github.com/dmadisetti/steam-tui"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl' 'steamcmd')
optdepends=('wine: Launch Windows games')
conflicts=("steam-tui")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/dmadisetti/steam-tui/main/LICENSE"
		"README-${pkgver}.md::https://raw.githubusercontent.com/dmadisetti/steam-tui/main/README.md")
source_x86_64=("${_pkgname}-${pkgver}::$url/releases/download/${pkgver}/steam-tui")
sha512sums=('fa4585beeb62d89ed337fa651c5fcc0be0416c72f214312dcb01ccb872a7d651d76ec53644b0abcee74a385707b01318b15bc3cbbb12af33777a45cd7787af37'
            'f741ef0a08d01ffaebf8b3121e0053de244de5aaa3e2562460e108bbab6d8c7b4ddf605883d4ead29d4e0b7b377e0d2ebbdf7c2b848c9082dfeaa33defcb2f09')
sha512sums_x86_64=('0b69d7ebd45d425417bb92b6629015c7dcd73fd41843081c051c428513d254deb4fbcbf54bc240271a4a92b823f3fb12b78d45b291b7101cfb0b96832e356143')

package() {
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
