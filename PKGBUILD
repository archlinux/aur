# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=batzconverter
pkgver=3.1.0
pkgrel=1
pkgdesc="Batman Timezone Converter - show times in different timezones with bash"
arch=('any')
url="https://github.com/chmouel/batzconverter"
license=('Apache-2.0')
depends=('bash' 'coreutils')
optdepends=(
  'fzf: interactive timezone selection'
  'gum: pretty table output'
  'wl-clipboard: clipboard/screenshot support on Wayland'
  'librsvg: PNG screenshot rendering (rsvg-convert)'
  'imagemagick: PNG screenshot rendering (alternative)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chmouel/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('68dc6add1d6e35d20ca46a82b42a027d403d5068e77ebe25fa675b1047649114')

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm755 batz.sh "$pkgdir/usr/bin/batz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
