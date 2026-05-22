pkgname=machina
pkgver=1.0.0
pkgrel=1
pkgdesc="Vim-keybinded TUI file manager with OneShot theme"
arch=('x86_64')
url="https://github.com/viewerofall/machina"
license=('MIT')
depends=('glibc' 'oniguruma')

source=(
  "machina-binary::https://github.com/viewerofall/machina/releases/download/v$pkgver/machina-$pkgver-x86_64-linux"
  "machina.sh::https://raw.githubusercontent.com/viewerofall/machina/main/machina.sh"
  "HOWTO.md::https://raw.githubusercontent.com/viewerofall/machina/main/HOWTO.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  # Install binary
  install -Dm755 "machina-binary" "$pkgdir/usr/bin/$pkgname"

  # Install shell wrapper
  install -Dm755 "machina.sh" "$pkgdir/usr/share/$pkgname/machina.sh"

  # Install HOWTO
  install -Dm644 "HOWTO.md" "$pkgdir/usr/share/doc/$pkgname/HOWTO.md"
}
