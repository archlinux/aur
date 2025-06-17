# Maintainer: JonasAlv
pkgname=zap-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/zap-rs_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  ar x "zap-rs_${pkgver}_amd64.deb"

  if [[ -f data.tar.xz ]]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [[ -f data.tar.gz ]]; then
    tar -xf data.tar.gz -C "$pkgdir"
  else
    echo "No data.tar archive found!"
    return 1
  fi
}
