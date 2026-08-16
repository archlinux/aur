# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=gallery-tui-bin
_pkgname=gallery-tui
pkgver=0.2.7
pkgrel=1
pkgdesc="A terminal image gallery powered by ratatui and chafa."
arch=('x86_64')
url="https://github.com/WindustH/gallery-tui"
license=('MIT')
depends=('chafa')
optdepends=('perl-image-exiftool: write image metadata from the detail editor')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('596cf5dd9f786d9e9e35df18d1339b553872e8cb2f7455fb60d8265d6b6eace6')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
