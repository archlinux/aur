# Maintainer: Kreuder <mk@singular.de>
pkgname=stenmark
pkgver=0.4.3
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
sha256sums=('fed2a0f5d703a31fa58afff7cfcd48bb92c14fea5adda4eb371dc1f50c500d1f')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
