# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=gallery-tui-bin
_pkgname=gallery-tui
pkgver=0.1.4
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
sha256sums=('ac75cac03d73238680f1ccf48558a8c29f5d82fe1d2167dd4435e6ab6590544a')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
