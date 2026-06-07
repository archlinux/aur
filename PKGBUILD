# Maintainer: 0xall3x  <ghost.security102@passinbox.com>
pkgname=eppie-preview-bin
pkgver=1.2.18.preview
_realver=1.2.18-preview
pkgrel=1
pkgdesc="Open protocol encrypted p2p email with Proton Mail support"
arch=('x86_64')
url="https://github.com/Eppie-io/Eppie-App"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'icu' 'libx11' 'libice' 'libsm')
options=('!strip' '!debug')
provides=('eppie')
conflicts=('eppie' 'eppie-bin')
source=("https://github.com/Eppie-io/Eppie-App/releases/download/v${_realver}/eppie.desktop-linux-x64.tar.gz"
        "eppie.desktop"
        "eppie-wrapper")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/opt/eppie"
    install -d "${pkgdir}/usr/bin"
  
    cp -r "${srcdir}/"* "${pkgdir}/opt/eppie/" 2>/dev/null || true
    
    rm -f "${pkgdir}/opt/eppie/eppie.desktop"
    
    install -Dm755 "${srcdir}/eppie-wrapper" "${pkgdir}/usr/bin/eppie-preview"
    install -Dm644 "${srcdir}/eppie.desktop" "${pkgdir}/usr/share/applications/eppie-preview.desktop"
    install -Dm644 "${pkgdir}/opt/eppie/Assets/Icons/iconLogo.targetsize-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/eppie-preview.png"
}
