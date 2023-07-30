# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Phira is a clone of the music game Phigros that supports custom beatmaps, multiplayer etc."
arch=('x86_64')
url="https://github.com/TeamFlos/phira"
license=('GPL3')
depends=(
    'gcc-libs'
)
makedepends=(
    'cargo'
    'git'
)
source=("${pkgname%-bin}-v$pkgver.zip::https://github.com/TeamFlos/${pkgname%-bin}/releases/download/v$pkgver/Phira-linux-v$pkgver.zip")
b2sums=('f70c1a067784ce7c74287a3621d5885fbcfa5edc26b60efd2985b40fc9674ef88259eea64a16e4fd090e7552cf48ef13f6ae46f37ad34b096af3836ade174c5b')

package() {
  install -Dm755 "${pkgname%-bin}-main" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main"
  cp -r "assets" "$pkgdir/usr/share/${pkgname%-bin}/"pkgname
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main" "$pkgdir/usr/bin/${pkgname%-bin}"
}
