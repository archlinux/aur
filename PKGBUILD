# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C
# Last updated September 4th 2026 @Arthurmeade12

pkgname=alda-bin
pkgver=2.4.7
pkgrel=1
pkgdesc='A music programming language for musicians'
arch=('i686' 'x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL-2.0')
depends=('java-runtime>=8')
provides=('alda')
conflicts=('alda') # If it ever appears on the AUR (it was not on the AUR as of 8/16/26), Alda also conflicts with IcedTea (https://openjdk.org/projects/icedtea/). See https://github.com/alda-lang/alda/blob/master/doc/troubleshooting.md#icedtea-related-issues for more.
source=("alda-player-$pkgver::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/player/non-windows/alda-player")
# I know namcap complains about having arch-specific sources, but upstream calls x86_64 amd64 and i686 i386. I didn't want to complicate things with an if statement
source_x86_64=("alda-$pkgver-x86_64::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-amd64/alda")
source_i686=("alda-$pkgver-i686::https://alda-releases.nyc3.digitaloceanspaces.com/$pkgver/client/linux-386/alda")
b2sums=('f792b770a2cbf45e1653e8fb744a1f7726b72a8356cb29ec08f714b0e17b9e87daf2c771f764eaf3629a46782b34d57a5c0486f3fcf508bfc28dbf08f8655e99')
b2sums_x86_64=('327a21623f9764ab3f35ee92e20cdfa9a16c4c162540241c64f848f4e1852f1ebba1f628547f7b43f177591b35f9c08dffed49cc687f424604f787e65913801a')
b2ums_i686=('7c381afafa560a3a85656a2b23375c4e309340251b3c83be216985506266135ac460f2cc9ebabcf22d467edae65c5b0ac8d882f3f33ad066898368eb8acded98')

package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
