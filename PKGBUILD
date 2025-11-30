# Maintainer: JonasAlv
pkgname=zap-elec
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-elec"
license=('MIT')
depends=('nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'libnotify' 'gtk3')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/zap-elec-${pkgver}-x64.pacman")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  tar -xf "zap-elec-${pkgver}-x64.pacman" -C "$pkgdir"

  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL"

  mkdir -p "$pkgdir/usr/bin"
  
  ln -sf /opt/zap-elec/whatsapp "$pkgdir/usr/bin/zap-elec"
}