# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C
# Last updated August 16th 2026 @Arthurmeade12

pkgname=alda-bin
pkgver=2.4.5
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
b2sums=('64076a6dea20f82f843cea6d60b6e5cc4d09056e80a34aeaf4db408c06af7904880e2ec22d068dd7824beaf3cbec72e8ac9ca263f47847f5868d6e905df99d96')
b2sums_x86_64=('3e6ea83b85feb97866251f60cb973d2d0f69b8f7c351e9018edc4030a54b6648d3cf4ae7823d19d5155314bda3c3a9631c019b985802219e841fcfd65a5fedc9')
b2sums_i686=('709e5fb471bf1f093b413079224720b9c7bc3831c20d2b24046e69f7741071db3d786f35b38eb0fc6e8a2ccbbbb8da66b3de4f9b10cab41b518faecf2a83ce86')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
