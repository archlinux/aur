# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=calibre-tui-bin
_pkgname=calibre-tui
pkgver=0.6.0
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
sha256sums=('c875274daae1e1be16a93e4a33d08a8b98835ab04e96fd9984437cb21906b699')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "preset/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 "preset/keymap.toml" "$pkgdir/usr/share/doc/$pkgname/keymap.toml.example"
}
