# Maintainer: 5unekku <@5unekku on Discord>
pkgname=tf2cdownloader-bin
_pkgname=tf2cdownloader
pkgver=2023.05.27
pkgrel=5
pkgdesc="Cross-platform utility for automatically downloading and installing TF2 Classic"
arch=('x86_64')
url="https://github.com/tf2classic/TF2CDownloader"
license=('GPL-3.0-only')
provides=("$_pkgname")
conflicts=("${_pkgname}-git")
source=("TF2CDownloaderLinux::https://github.com/tf2classic/TF2CDownloader/releases/download/2023-05-27/TF2CDownloaderLinux")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/TF2CDownloaderLinux" "$pkgdir/usr/bin/TF2CDownloaderLinux"
  cat > "$pkgdir/usr/bin/tf2cdownloader" << 'EOF'
#!/bin/bash
exec /usr/bin/TF2CDownloaderLinux "$@"
EOF
  chmod +x "$pkgdir/usr/bin/tf2cdownloader"
}
