# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.0.10
pkgrel=1
pkgdesc='Snippet manager with rofi/wofi and fzf'
arch=('any')
url='https://github.com/barbUk/snippy'
license=('GPL-3.0-or-later')
conflicts=("${pkgname}-git")
depends=(bash fzf jq rofi)
optdepends=(
  'wtype: Wayland support'
  'wl-clipboard: Wayland support'
  'xsel: X11 support'
  'xclip: X11 support'
  'xdotool: X11 support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('778c69143a5c05892b3a601b9b2e14c84a2f4685df8fec07e12a8d35cf80e84f')

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
