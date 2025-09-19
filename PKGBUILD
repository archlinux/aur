# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.0.1
pkgrel=1
pkgdesc='Snippet manager with rofi/wofi and fzf'
arch=('any')
url='https://github.com/barbUk/snippy'
license=('GPL-3.0-or-later')
conflicts=("${pkgname}-git")
depends=(bash fzf jq)
optdepends=(
  'wofi: Wayland support'
  'wtype: Wayland support'
  'wl-clipboard: Wayland support'
  'rofi: X11 support'
  'xsel: X11 support'
  'xclip: X11 support'
  'xdotool: X11 support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a6543267496cbafb22ada2782065872f847db8219366873d52e1c25799d3e61a')

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
