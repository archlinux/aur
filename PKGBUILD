# Maintainer: jdev082 jdev0892@gmail.com
# Previous Maintainer: Kitsu mail@kitsu.me
pkgname=lapce-bin
pkgver=0.3.1
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
  '273874140961aa07cb419ef519f21a9a14177be972cd21a8b24cd37a35daf74d'
  '9b58e88667ff2fdf2d1fe199b860621bae7b6450f9908f7fc9409a314f0ec7f6'
  '0af99445cd49db50bc7f3a7c544d2ccdbade440eab1207b1830f5a4d47a76fca'

)

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/apps"
  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 "logo.svg" "$pkgdir/usr/share/icons/hicolor/apps/dev.lapce.lapce.svg"
  install -Dm644 "lapce.desktop" "$pkgdir/usr/share/applications/lapce.desktop"
  install -Dm755 "Lapce/lapce" "$pkgdir/usr/bin/lapce"
}

