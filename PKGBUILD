pkgname=forgecode-bin2
pkgver=2.13.19
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
sha256sums_x86_64=('5f395637c264f3f195d22fe8e2ce1b47e54cb6f51e2bb7bab5ce2e11b8b83958')
sha256sums_aarch64=('49d2d072997d5558676cec4247f55b3860d79a2442b5f1d9b038d154bbac3162')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
