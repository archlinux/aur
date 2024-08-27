# Maintainer: Your Name <your_email@example.com>
pkgname=web2pdf
pkgver=11.0
pkgrel=1
pkgdesc="A CLI tool to extract a part of a website, create a PDF"
arch=('any')
url="https://github.com/simit22/web2pdf"
license=('GPL')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-weasyprint' 'imagemagick')
source=("web2pdf.py")
md5sums=('SKIP')

package() {
    cd "$srcdir"
    install -Dm755 web2pdf.py "$pkgdir/usr/bin/web2pdf.py"
    ln -s /usr/bin/web2pdf.py "$pkgdir/usr/bin/web2pdf"
    sed -i '1s|^|#!/usr/bin/env python\n|' "$pkgdir/usr/bin/web2pdf.py"
}
