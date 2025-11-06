# Maintainer: ZhX589 <zhx589@outlook.com>

pkgname=ffxiv-ensemble-wine
pkgver=3.0.1
pkgrel=1
pkgdesc="FFXIV 世界终末乐团（FFDash）——免费但非开源的 Windows 游戏（Wine 封装版）"
arch=('x86_64')
url="https://ffdash.rika.link/"
license=('custom:Unfree')
depends=('wine' 'cabextract' 'unzip' 'curl')
source=("https://ffdash.rika.link/release/windows"
        "ffxiv-ensemble-wine.sh"
        "ffxiv-ensemble-wine.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -dm755 "$pkgdir/opt/ffxiv-ensemble-wine"
  bsdtar -xf "windows" -C "$pkgdir/opt/ffxiv-ensemble-wine"

  install -Dm755 "ffxiv-ensemble-wine.sh" "$pkgdir/usr/bin/ffxiv-ensemble-wine"
  install -Dm644 "ffxiv-ensemble-wine.desktop" "$pkgdir/usr/share/applications/ffxiv-ensemble-wine.desktop"
}

