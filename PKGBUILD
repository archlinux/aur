# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=music-tui-bin
_pkgname=music-tui
pkgver=0.1.3
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
sha256sums=('37c683f8108f5a5a5a0d1d1cab9f61df8cd17660b9a953243324dfd7f1e6ff04')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$_pkgname/"
}
