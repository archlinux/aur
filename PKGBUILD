# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=ibus-autostart-kimpanel
pkgver=1.2
pkgrel=2
pkgdesc="iBus daemon autostart with XDG Autostart Specification (kimpanel)"
arch=('any')
license=('none')
depends=('ibus' 'plasma-desktop')
conflicts=('ibus-autostart')

package() {
  mkdir -p "$pkgdir/etc/xdg/autostart"
  cat <<'EOF' > "$pkgdir/etc/xdg/autostart/ibus-daemon.desktop"
[Desktop Entry]
Name=IBus (KIMPanel)
GenericName=Input Method Framework
Comment=Start IBus Input Method Framework
Exec=ibus-daemon -rxR --panel=/usr/lib/kimpanel-ibus-panel
Icon=ibus
NoDisplay=true
Type=Application
Categories=System;Utility;
X-KDE-autostart-after=panel
EOF
}
