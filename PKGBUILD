# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=music-tui-bin
_pkgname=music-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal music player backed by MPD, with covers, synced lyrics and a visualizer."
arch=('x86_64')
url="https://github.com/WindustH/music-tui"
license=('MIT')
depends=('mpd' 'chafa' 'sqlite')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-stable" "$_pkgname-git")
options=('!strip')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ac8c18f09ee54e9717632c0c67e99a63e018600c75399e83a165ce7977e1722d')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$_pkgname/"
}
