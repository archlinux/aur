pkgname=forgecode-bin
pkgver=2.12.13
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
sha256sums_x86_64=('eea5658bbc35c641bbe8b1d78b2994471f58fbc9a4588f5263f8d6cfd9bd1f32')
sha256sums_aarch64=('04ebe23167f67658b8a249f2d831af92d0b1abd7359a2acc85e676c9ef73a612')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}