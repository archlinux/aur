# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=calibre-tui-bin
_pkgname=calibre-tui
pkgver=0.6.3
pkgrel=1
pkgdesc="A TUI application to search and open books in your Calibre library."
arch=('x86_64')
url="https://github.com/WindustH/calibre-tui"
license=('MIT')
depends=('xdg-utils' 'sqlite')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('71532c31b205cadc22e5b01758391d9a0829aa310bee0a432d74ef22c98ad296')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "preset/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 "preset/keymap.toml" "$pkgdir/usr/share/doc/$pkgname/keymap.toml.example"
}
