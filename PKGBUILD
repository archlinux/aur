# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=pdf-tui-bin
_pkgname=pdf-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal PDF reader built with ratatui and terminal graphics protocols."
arch=('x86_64')
url="https://github.com/WindustH/pdf-tui"
license=('MIT')
depends=('chafa' 'pdftk' 'poppler')
optdepends=('perl-image-exiftool: edit PDF metadata')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('fc3597063abe5d1ecdde92062bbd7108ef5c697558a8474391192c111ea17a13')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
