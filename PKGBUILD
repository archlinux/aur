# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.3.2
pkgrel=2
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
b2sums=('638abeaa706f8afa82884a40c5333a694e696681f67205de6991dda8f230b22c1776332031a8c69e523a8bbde7fcfe23addc0718442c2bc9868e19ec863645be')
b2sums_x86_64=('6be830b6b54f594f3042d47238e26e057b717bbaa08077f0cf5851f6e4de09625e6302afb632adfc1b68b65e4014fe4859be362b5af7e41ebafee930878c15a7')
b2sums_i686=('1cd828cd7b2c3f84f231b1caf4660d1535ca68d67e192352ae82087c24bd8225d5a0fa876219ee92a81c10263a59381672ababce03ef4412a34ebb678e9c37f9')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
