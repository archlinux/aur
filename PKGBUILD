# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('i686' 'x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL-2.0')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda')
source=("alda-player-$pkgver::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/player/non-windows/alda-player")
# I know namcap complains about having arch-specific sources, but upstream calls x86_64 amd64 and i686 i386. I didn't want to complicate things with an if statement
source_x86_64=("alda-$pkgver-x86_64::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-amd64/alda")
source_i686=("alda-$pkgver-i686::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-386/alda")
b2sums=('d30ab7e2feb624e5abc14b4c7035013754acfd66b013f6fcff5557ecde809ae36a67f74a7271d24a971c8cabb04f866428fded225adbe5a6ac44f28bfc962bec')
b2sums_x86_64=('85ebb6405265b6a89e2d20379dd5747426dd4e3dabcd38a962c49913a35ee3ddf27f6ed466b94c830ea9234769885903c4a84537f24078eabc7c51dfd58649a9')
b2sums_i686=('745b40f3877f0e7ee7ef345438a3e6a990be08bab585a6f4e0ccfc0cf863a43b1eb7add0aa519290714a1adc70717af79ce41a847e0e4bc24e02f0a06ded4604')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
