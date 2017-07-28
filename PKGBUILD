# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=text2pdf
pkgver=1.1
pkgrel=1
pkgdesc='Converts text files to PDF on the command line'
arch=('i686' 'x86_64')
url='http://www.eprg.org/pdfcorner/text2pdf/'
license=('custom')
depends=('glibc')
source=('http://www.eprg.org/pdfcorner/text2pdf/text2pdf.c'
        'http://www.eprg.org/pdfcorner/text2pdf/text2pdf.1')
sha256sums=('a11d07787f4e9febddd96888ff319c5c527a5436d27c75a4bac16d11fcf45600'
            '5f21feda206bd26df11938e1ff9d9c246e04a6c250225d5561e0242f38af68fe')

prepare() {
  head -n 24 text2pdf.c > LICENSE
}

build() {
  gcc $CFLAGS -v -o text2pdf text2pdf.c
}

package() {
  install -Dm755 text2pdf "$pkgdir"/usr/bin/text2pdf
  install -Dm644 text2pdf.1 "$pkgdir"/usr/share/man/man1/text2pdf.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
