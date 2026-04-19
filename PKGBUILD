# Maintainer: Sokpiseth Thin <sokpiseth.thin@gmail.com>

pkgname=doter-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple GTK4 GUI for managing dotfiles with Git"
arch=('x86_64')
url="https://github.com/qwlp/doter"
license=('MIT')
depends=('git' 'gtk4')
provides=('doter')
conflicts=('doter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qwlp/doter/releases/download/v$pkgver/doter-$pkgver-x86_64-linux.tar.gz")
sha256sums=('e027294d65acb74b78b18e7d9e881559817bb8697a6ee679d6ecd34224378749')

package() {
  cd "$srcdir/doter-$pkgver-x86_64-linux"

  install -Dm755 doter "$pkgdir/usr/bin/doter"
  install -Dm644 com.tsp.doter.desktop "$pkgdir/usr/share/applications/com.tsp.doter.desktop"
  install -Dm644 doter.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/doter.png"
  install -Dm644 doter.png "$pkgdir/usr/share/pixmaps/doter.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/doter/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
