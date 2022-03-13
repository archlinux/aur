# Maintainer Nathan Fisher <jeang3nie at hitchhiker-linux dot org>
pkgname=eva-browser
pkgver=0.2.0
pkgrel=1
pkgdesc='A gemini browser in Gtk4'
arch=('x86_64')
url='https://codeberg.org/jeang3nie/eva'
license=('GPL3')
depends=('gtk4')
makedepends=('rust')
source=("https://codeberg.org/jeang3nie/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=(
  'ee53da53ad8cd751cf7f5f4a6d0f83df19420cd8421ea9cc46fd4c7d39f29791e2a8330203c215c0ed3211ad4952f464eb184a00fa023a22e5e1df73ab423a99'
)

build() {
  cd eva
  cargo build --release
}

package() {
  cd eva
  install -Dm755 "target/release/eva" "pkgdir/usr/bin/eva"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "data/eva.desktop" "$pkgdir/usr/share/applications/eva.desktop"
  install -Dm644 "data/eva.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/eva.svg"
}
