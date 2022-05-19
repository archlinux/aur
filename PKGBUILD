# Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Lightning-fast and Powerful Code Editor written in Rust"
arch=('x86_64')
url="https://github.com/lapce/lapce"
license=('Apache')
depends=('gcc-libs' 'fontconfig' 'libxcb' 'zlib')
provides=('lapce')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/lapce/lapce/releases/download/v$pkgver/Lapce-linux.tar.gz"
  "logo.svg::https://raw.githubusercontent.com/lapce/lapce/v$pkgver/extra/images/logo.svg"
  "lapce.desktop::https://raw.githubusercontent.com/lapce/lapce/v$pkgver/extra/linux/dev.lapce.lapce.desktop"
)
sha256sums=(
  'c18bb7238f8991cb1b1ffc7b8be3dd9e46b46fb9bfb0fe6b9dc986795572b688'
  '9b58e88667ff2fdf2d1fe199b860621bae7b6450f9908f7fc9409a314f0ec7f6'
  '07e6b1b685c88b8f23919f58f9e2210a0357836b12026b5a04b0c18b4acfd34a'
)

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/apps"
  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 "logo.svg" "$pkgdir/usr/share/icons/hicolor/apps/dev.lapce.lapce.svg"
  install -Dm644 "lapce.desktop" "$pkgdir/usr/share/applications/lapce.desktop"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/lapce"
}

