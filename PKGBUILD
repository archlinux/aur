# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
pkgname=dpsprep-git
_gitname=dpsprep
pkgver=r10.e52d7ca
pkgrel=1
pkgdesc="Python DJVU to PDF converter which preserves OCR text and bookmark metadata (e.g. TOC)"
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python2' 'python2-sexpdata' 'python2-argparse' 'djvulibre' 'ocrodjvu' 'pdfbeads' 'pdftk-bin' 'ruby-iconv')
optdepends=('jbig2enc-git: JBIG2 encoder provides much better PDF compression')
source=('git+git://github.com/kcroker/dpsprep.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m644 "$srcdir/$_gitname/README.md" "$pkgdir/usr/share/doc/$_gitname/README.md"
    install -D -m755 "$srcdir/$_gitname/dpsprep" "$pkgdir/usr/bin/dpsprep"
}
