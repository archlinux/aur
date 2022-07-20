# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
pkgname=dpsprep-git
_gitname=dpsprep
pkgver=r17.3d657d7
pkgrel=1
pkgdesc="Python DJVU to PDF (djvu2pdf) converter which preserves OCR text and bookmarks (table of contents)"
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('djvulibre' 'java-commons-lang' 'ocrodjvu' 'pdfbeads' 'pdftk' 'python'
         'python-argparse' 'python-sexpdata' 'ruby-iconv' 'ruby-nokogiri')
optdepends=('jbig2enc-git: JBIG2 encoder provides much better PDF compression')
source=("git+https://github.com/kcroker/dpsprep.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m644 "$srcdir/$_gitname/README.md" "$pkgdir/usr/share/doc/$_gitname/README.md"
    install -D -m755 "$srcdir/$_gitname/dpsprep" "$pkgdir/usr/bin/dpsprep"
}
