pkgname=ioexplorer
pkgver=r6.3fa9908
pkgrel=1
pkgdesc='Wayland-native provider-oriented file manager for Wayland desktops'
arch=('x86_64')
url='https://github.com/LucasionGS/ioexplorer'
license=('MIT')
depends=('gtk4' 'glib2')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/LucasionGS/ioexplorer.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/ioexplorer "$pkgdir/usr/bin/ioexplorer"
  install -Dm644 data/io.github.ionix.IoExplorer.desktop "$pkgdir/usr/share/applications/io.github.ionix.IoExplorer.desktop"
  install -Dm644 data/io.github.ionix.IoExplorer.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.ionix.IoExplorer.metainfo.xml"
  install -Dm644 data/icons/hicolor/scalable/apps/io.github.ionix.IoExplorer.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ionix.IoExplorer.svg"
}
