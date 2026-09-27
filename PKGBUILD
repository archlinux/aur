# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=calibre-tui-bin
_pkgname=calibre-tui
pkgver=0.6.2
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
sha256sums=('ef48ae7b63dfb1a3800a6092f49e46e7fd6f67c73d850a9226f135cf18504167')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "preset/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 "preset/keymap.toml" "$pkgdir/usr/share/doc/$pkgname/keymap.toml.example"
}
