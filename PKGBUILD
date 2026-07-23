# Maintainer: WindustH <windusth2006@gmail.com>

pkgname=pdf-tui-bin
_pkgname=pdf-tui
pkgver=0.2.3
pkgrel=1
pkgdesc="Terminal PDF reader built with ratatui and terminal graphics protocols."
arch=('x86_64')
url="https://github.com/WindustH/pdf-tui"
license=('MIT')
depends=('chafa' 'mupdf-tools' 'pdfium-binaries-bin' 'pdftk' 'poppler')
optdepends=(
  'perl-image-exiftool: edit PDF metadata'
  'wl-clipboard: copy selected text and PNGs on Wayland'
  'xclip: copy selected text and PNGs on X11'
  'xsel: copy selected text on X11'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('ef9c2369bac37f7e487199695ba696f6f4166e32761765747cec71049591d8e6')

package() {
  cd "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$pkgname/"
}
