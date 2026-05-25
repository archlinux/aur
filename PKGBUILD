# Maintainer: Reyansh Raj Mishra <reyansh@shield.int>
pkgname=shield-authenticator-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="SHIELD Authenticator - Military-grade 2FA desktop app (Tauri wrapper)"
arch=('x86_64')
url="https://shield.int"
license=('custom:SHIELD')
depends=('webkit2gtk-4.1' 'libx11' 'gtk3' 'libnotify' 'libxcb' 'libsecret')
source=()
sha256sums=()

package() {
  # Create directories
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/shield-authenticator"
  install -d "${pkgdir}/usr/share/shield-authenticator"
  install -d "${pkgdir}/usr/share/applications"
  
  # Install binary
  install -Dm755 "${srcdir}/../usr/lib/shield-authenticator/shield-authenticator" \
    "${pkgdir}/usr/lib/shield-authenticator/shield-authenticator"
  
  # Install wrapper script
  install -Dm755 "${srcdir}/../usr/bin/shield-authenticator" \
    "${pkgdir}/usr/bin/shield-authenticator"
  
  # Copy static build folder
  cp -r "${srcdir}/../usr/share/shield-authenticator/build" \
    "${pkgdir}/usr/share/shield-authenticator/"
  
  # Install desktop entry
  install -Dm644 "${srcdir}/../shield-authenticator.desktop" \
    "${pkgdir}/usr/share/applications/shield-authenticator.desktop"
}
