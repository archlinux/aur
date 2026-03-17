# Maintainer: Kreuder <mk@singular.de>
pkgname=stenmark
pkgver=0.4.5
pkgrel=1
pkgdesc='A lightweight GTK4 Markdown organizer and editor'
arch=('any')
url='https://github.com/mkay/stenmark'
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'python-markdown'
  'python-pygments'
  'gtk4'
  'libadwaita'
  'webkitgtk-6.0'
)
conflicts=('marklite')
replaces=('marklite')
makedepends=(
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkay/stenmark/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9190dd2bd2626e643337e72162ab766fb51128d13aebce297556924d28d31f3')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
