# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
pkgname=dpsprep-git
_gitname=dpsprep
pkgver=r12.8a11d83
pkgrel=3
pkgdesc="Python DJVU to PDF (djvu2pdf) converter which preserves OCR text and bookmarks (table of contents)"
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('djvulibre' 'java-commons-lang' 'ocrodjvu' 'pdfbeads' 'pdftk' 'python2'
         'python2-argparse' 'python2-sexpdata' 'ruby-iconv' 'ruby-nokogiri')
optdepends=('jbig2enc-git: JBIG2 encoder provides much better PDF compression')
source=(git+git://github.com/kcroker/dpsprep.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m644 "$srcdir/$_gitname/README.md" "$pkgdir/usr/share/doc/$_gitname/README.md"
    install -D -m755 "$srcdir/$_gitname/dpsprep" "$pkgdir/usr/bin/dpsprep"
}
