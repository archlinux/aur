# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=snippy-snippet
pkgver=1.0.6
pkgrel=1
pkgdesc='Snippet manager with rofi/wofi and fzf'
arch=('any')
url='https://github.com/barbUk/snippy'
license=('GPL-3.0-or-later')
conflicts=("${pkgname}-git")
depends=(bash fzf jq)
optdepends=(
  'wtype: Wayland support'
  'wl-clipboard: Wayland support'
  'rofi: X11 support'
  'xsel: X11 support'
  'xclip: X11 support'
  'xdotool: X11 support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4777e613223cbac87b793a13fda46f9f7309a278f13e035ca92a8ee1aafeb2fd')

package() {
  cd "snippy-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 snippy "$pkgdir"/usr/bin/$pkgname
}
