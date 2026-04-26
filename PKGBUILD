pkgname=mxlauncher-bin
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url="http://10.65.185.180"
license=('custom')

source_x86_64=("mxlauncher::http://10.65.185.180/api/launcher/download/linux-x64")
source_aarch64=("mxlauncher::http://10.65.185.180/api/launcher/download/linux-arm64")
source_armv7h=("mxlauncher::http://10.65.185.180/api/launcher/download/linux-arm")

source+=("icon.jpg::http://10.65.185.180/icon.jpg")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/mxlauncher" "$pkgdir/usr/bin/mxlauncher"

  install -Dm644 "$srcdir/icon.jpg" "$pkgdir/usr/share/pixmaps/mxworld.jpg"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mxworld.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=MxWorld
Exec=mxlauncher
Icon=mxworld
Terminal=false
Categories=Game;
EOF
}
