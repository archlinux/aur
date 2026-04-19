# Maintainer: Sokpiseth Thin <sokpiseth.thin@gmail.com>

pkgname=doter-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple GTK4 GUI for managing dotfiles with Git"
arch=('x86_64')
url="https://github.com/qwlp/doter"
license=('MIT')
depends=('git' 'gtk4')
provides=('doter')
conflicts=('doter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qwlp/doter/releases/download/v$pkgver/doter-$pkgver-x86_64-linux.tar.gz")
sha256sums=('a09b5cc07838519f17ff3a81b8b8280c40a3abfe671ee717dcfdf5200661adfe')

package() {
  cd "$srcdir/doter-$pkgver-x86_64-linux"

  install -Dm755 doter "$pkgdir/usr/bin/doter"
  install -Dm644 com.tsp.doter.desktop "$pkgdir/usr/share/applications/com.tsp.doter.desktop"
  install -Dm644 doter.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/doter.png"
  install -Dm644 doter.png "$pkgdir/usr/share/pixmaps/doter.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/doter/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
