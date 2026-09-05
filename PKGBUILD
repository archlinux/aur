# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=music-tui-bin
_pkgname=music-tui
pkgver=0.1.8
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
sha256sums=('471cdf91736e2d4db45b44c37362656c076663599724688b53a15b08a482d393')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$_pkgname/"
}
