pkgname=forgecode-bin
pkgver=2.12.12
pkgrel=1
pkgdesc="An AI-powered code assistant CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/antinomyhq/forgecode"
license=('Apache-2.0')
provides=('forge')
conflicts=('forge')
depends=(
  'fzf'
  'bat'
  'fd'
)
_baseurl=https://github.com/tailcallhq/forgecode/releases/download/v${pkgver}
source_x86_64=(
  "forge::${_baseurl}/forge-x86_64-unknown-linux-gnu"
)
source_aarch64=(
  "forge::${_baseurl}/forge-aarch64-unknown-linux-gnu"
)
source=("LICENSE")
sha256sums_x86_64=('2ff5ae064005fdcf5808f23183716a4e90171af4d3f3103242df87f80dc469c1')
sha256sums_aarch64=('1c7756f09c597f9b98bbe0301848c944e17e764ddd27f1794a3dd8763005cfef')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forge-code"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}