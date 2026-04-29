pkgname=forgecode-bin
pkgver=2.12.10
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
sha256sums_x86_64=('493e016e62818f56e612395019a73a247c8c66cec3d854c982195e187d41b25b')
sha256sums_aarch64=('6b4b9057185bddcf0a4138fe26790960d6d45c078e342d715e3da14a50196dc7')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forge-code"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}