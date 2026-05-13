# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.4.3
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
b2sums=('270ae34c931747982e1bc97c23d013dbfd32bf3e748837b4958ae28a40f9404b8f5d83f5d809767a1a5cf6e0465aa25994dc3531d406fabc351c5aef21da6bd5')
b2sums_x86_64=('3d99fe3272174a8675d62d5f0a0854ce2e1601b5b714174a9be2ef376153643b6477abd64c5a5e66378e80c5b12acb2e4cb718d6b53dce6f39750e00c06f8df8')
b2sums_i686=('248f64b87bc7faf82461ecbdb84f5e4ca2ef38749fb8aa4c30f70d1d550cb3e02f230fb4c9a68ed554960c328a53780e37935011f4bc5674842c67ab6ab4e100')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
