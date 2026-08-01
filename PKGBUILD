pkgname=forgecode-bin2
pkgver=2.13.21
pkgrel=1
pkgdesc="CLI code assistant; pre-built upstream binary"
arch=('x86_64' 'aarch64')
url="https://github.com/tailcallhq/forgecode"
license=('Apache-2.0')
provides=('forgecode-bin' 'forge')
conflicts=('forgecode-bin' 'forge')
depends=('fzf' 'bat' 'fd')
_baseurl=https://github.com/tailcallhq/forgecode/releases/download/v${pkgver}
source_x86_64=("forge::${_baseurl}/forge-x86_64-unknown-linux-gnu")
source_aarch64=("forge::${_baseurl}/forge-aarch64-unknown-linux-gnu")
source=("LICENSE")
sha256sums_x86_64=('300acf69e39ea5a452e6544f3191470317a14226b6b1a91821c95815e07a8b88')
sha256sums_aarch64=('b9336b652c1233a07dea8eb4e864785e03c1d9706025768a19ac3b6646936539')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
