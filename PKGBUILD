pkgname=forgecode-bin2
pkgver=2.13.20
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
sha256sums_x86_64=('1c00df3276e1c0b80793c3ad0b16ef2f91fb4de9f7b9882653976b276d0d38fd')
sha256sums_aarch64=('4b8a91e26ed527e36965c8b45d2255b95d78b3099ba71a389b6f066033632acf')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
