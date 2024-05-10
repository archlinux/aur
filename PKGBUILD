# Maintainer: Your Name <your_email@example.com>
pkgname=pdf_translator
pkgbase=pdf_translator
pkgver=3.0
pkgrel=1
pkgdesc="this script will translate your pdf , and create a new translated PDF  "
arch=('any')
url="https://github.com/simit22/pdf-translator"
license=('GPL')
depends=('python' 'python-pypdf2' 'python-reportlab' 'translate-shell')  # Add any other dependencies here
source=("pdfTranslate.py")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 pdfTranslate.py "$pkgdir/usr/bin/pdfTranslate.py"
    ln -s /usr/bin/pdfTranslate.py "$pkgdir/usr/bin/pdfTranslate"
    sed -i '1s|^|#!/usr/bin/env python\n|' "$pkgdir/usr/bin/pdfTranslate.py"
}

