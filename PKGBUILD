pkgname=forgecode-bin
pkgver=2.12.14
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
sha256sums_x86_64=('3c85f0352f8dbc35044ebc420f38b6b39a1e63488cef7ac0d07d763b98d0caa0')
sha256sums_aarch64=('9975da5922dae9619810cce4c8b34a6cd06adcc8fef1c8dd153d50de1472fbea')
sha256sums=('3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9')

package() {
  install -Dm0755 forge "$pkgdir/usr/bin/forge"
  ln -sf forge "$pkgdir/usr/bin/forgecode"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}