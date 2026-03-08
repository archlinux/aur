# Maintainer: Arthurmeade12 <s728c3ilp at relay dot firefox dot com>
# Former Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Former Contributor: 0x715C

pkgname=alda-bin
pkgver=2.4.1
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
b2sums=('d3802ebcb52b4b63b76b3f24755e1117b636a2e4b80cad29922720d6ee84109ad5fd1d1994fc2bba53cca3fc42907b3cd4b24ea293f9b420f76d9e8d3f2d574b')
b2sums_x86_64=('cfd271fd5cfc2515a08486ef0e0eaab1ade2706002418a6855caf8d6c5f45cf3cf7089a202d0e0a43394443487ac107ae61b7d87f629913b552de7074c9d88ef')
b2sums_i686=('486832d2eb859e7f9389962b4934d7926eb346b0f8fbda7794988b31a3e30a968194f75f7d5337c7a01f8c061dee9e5802b55e756a729f549e2e505bc793ed52')
package() {
  install -Dv "alda-$pkgver-$CARCH" "$pkgdir/usr/bin/alda"
  install -Dv "alda-player-$pkgver" "$pkgdir/usr/bin/alda-player"
}
