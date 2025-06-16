# Maintainer: JonasAlv
pkgname=zap-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple and minimal web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libsoup' 'glib2' 'pango' 'gdk-pixbuf2' 'cairo' 'desktop-file-utils' 'hicolor-icon-theme')
install="$pkgname.install"
source=("zap-rs_0.1.0_amd64.deb::${url}/releases/download/v${pkgver}/zap-rs_0.1.0_amd64.deb")
sha256sums=('SKIP')

package() {
  bsdtar -xf "$srcdir/zap-rs_0.1.0_amd64.deb" -C "$srcdir"
  cd "$srcdir"
  if [[ -f data.tar.xz ]]; then
    bsdtar -xf data.tar.xz -C "$pkgdir"
  elif [[ -f data.tar.gz ]]; then
    bsdtar -xf data.tar.gz -C "$pkgdir"
  else
    echo "No data.tar archive found"
    return 1
  fi
}
