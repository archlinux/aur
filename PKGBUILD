# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=gallery-tui-bin
_pkgname=gallery-tui
pkgver=0.2.16
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
source=("$_pkgname-$pkgver-${CARCH}-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('f17c77053cb976c7c3011e7451036cdc18b3b14957045b8f5ea0ecb343abd078')

package() {
  cd "$srcdir/$_pkgname-$pkgver-${CARCH}-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
