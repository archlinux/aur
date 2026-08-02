# Maintainer: Han <tabularasa8931@gmail.com>
pkgname=gorae-bin
_pkgname=gorae
pkgver=2.4.0
pkgrel=1
pkgdesc="Terminal-first knowledge base for PDFs, EPUBs, and Markdown — with a built-in AI assistant"
arch=('x86_64')
url="https://github.com/Han8931/gorae"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('poppler')
optdepends=(
  'chafa: ASCII/sixel preview fallback for non-Kitty/iTerm2 terminals'
  'zathura: recommended PDF viewer with vi-style navigation'
  'zathura-pdf-mupdf: MuPDF backend for zathura'
)
source=("$_pkgname-$pkgver::https://github.com/Han8931/gorae/releases/download/v$pkgver/gorae-linux-amd64"
        "LICENSE-$_pkgname-$pkgver::https://raw.githubusercontent.com/Han8931/gorae/v$pkgver/LICENSE")
sha256sums=('408c6c91b24be445227255239155dbe071c7e44bada3bbbf265c3634856ef537'
            'SKIP')
noextract=("$_pkgname-$pkgver")

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE-$_pkgname-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
