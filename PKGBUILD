# Maintainer: Sokpiseth Thin <sokpiseth.thin@gmail.com>

pkgname=doter-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple GTK4 GUI for managing dotfiles with Git"
arch=('x86_64')
url="https://github.com/qwlp/doter"
license=('MIT')
depends=('git' 'gtk4')
provides=('doter')
conflicts=('doter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/qwlp/doter/releases/download/v$pkgver/doter-$pkgver-x86_64-linux.tar.gz")
sha256sums=('fba651093402996d6cede6f3a0540fd0cc507c9aadfdcb411f5920e772ce5832')

package() {
  cd "$srcdir/doter-$pkgver-x86_64-linux"

  install -Dm755 doter "$pkgdir/usr/bin/doter"
  install -Dm644 doter.desktop "$pkgdir/usr/share/applications/doter.desktop"
  install -Dm644 doter.png "$pkgdir/usr/share/pixmaps/doter.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/doter/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
