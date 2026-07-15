# Maintainer: Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=batzconverter
pkgver=3.0.0
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
sha256sums=('6ebbb11dc8bf9b4a709aaf782a81acfd053ef742bbd503cce8bdd6def5171407')

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm755 batz.sh "$pkgdir/usr/bin/batz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
