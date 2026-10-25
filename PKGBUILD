# Maintainer: Arthurmeade12 <ajmeade at proton dot me>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C
# Last updated October 24th 2026 @Arthurmeade12

pkgname=alda-bin
pkgver=2.4.8
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('i686' 'x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL-2.0')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda' 'icedtea-web')
source=("alda-player-$pkgver::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/player/non-windows/alda-player")
# I know namcap complains about having arch-specific sources, but upstream calls x86_64 amd64 and i686 i386. I didn't want to complicate things with an if statement
source_x86_64=("alda-$pkgver-x86_64::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-amd64/alda")
source_i686=("alda-$pkgver-i686::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-386/alda")
b2sums=('deb295cc208c58517043462cfc3532957f0852618dd6ccedbbc54fc5688992a28c0df957b4642be6ce711ec732981e10891a6b91046ed2bc45239e5c7313c768')
b2sums_x86_64=('8ee24cb264e2ec7f3ea01fd481ff1ba49d4213f54f3f39a004cc5ec229b39170c01db9abca341fa06a02cecc4497ee48d15dd1f8e51e23a7a39efa8f2d41e4b5')
b2sums_i686=('26897610ef2e73024bcfc3ea879b198ffaef27ea805fde3dbd5ce7eed0b116168b148f9510ab5a3a903b5b1940933274673a20384d188fc28d30cd435b530e77')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
