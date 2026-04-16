pkgname=i2tor-bin
pkgver=0.1.8
pkgrel=1
pkgdesc='Desktop launcher that combines Tor Browser and Java I2P'
arch=('x86_64')
url='https://github.com/SethMcGuire/i2tor'
license=('MIT')
depends=('gtk3' 'glib2' 'libx11' 'libxcursor' 'libxfixes' 'libxinerama' 'libxrandr' 'mesa' 'gnupg')
optdepends=('xdg-utils: desktop integration helpers')
provides=('i2tor')
conflicts=('i2tor')
validpgpkeys=('DEEDD0E4162AEF688A80890FC533BA97BB9EC07F')
source=("i2tor-${pkgver}-linux-x86_64::https://github.com/SethMcGuire/i2tor/releases/download/v${pkgver}/i2tor-${pkgver}-linux-x86_64"
        "i2tor-${pkgver}-linux-x86_64.asc::https://github.com/SethMcGuire/i2tor/releases/download/v${pkgver}/i2tor-${pkgver}-linux-x86_64.asc"
        "i2tor.desktop::https://raw.githubusercontent.com/SethMcGuire/i2tor/v${pkgver}/packaging/linux/i2tor.desktop"
        "i2tor.png::https://raw.githubusercontent.com/SethMcGuire/i2tor/v${pkgver}/i2tor.png")
sha256sums=('SKIP'
            'SKIP'
            '15269b9e6cc3215d7af82d730a561338d82b79497f8783c41eef41ae18485b13'
            '82808187cf275ad420b71900ed162171db8841e4b4861ecaab7f88e9a8ef3dde')

package() {
  install -Dm755 "${srcdir}/i2tor-${pkgver}-linux-x86_64" "${pkgdir}/usr/bin/i2tor"
  install -Dm644 "${srcdir}/i2tor.desktop" "${pkgdir}/usr/share/applications/i2tor.desktop"
  install -Dm644 "${srcdir}/i2tor.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/i2tor.png"
}
