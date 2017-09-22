# Maintainer: Liam Diprose <ldi30 at uclive dot ac.nz>

pkgname="python-learnpdf"
pkgver="2.0.0"
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc="LearnPDF is a file crawler and downloader for Moodle APIs"
url="https://github.com/liamdiprose/LearnPDF"
makedepends=('git')
depends=('python>3.3' 'python-requests>2.0')

prepare() {
        git clone https://github.com/liamdiprose/LearnPDF.git --depth 1 $srcdir
}

package () {
        mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/"
        mv "$srcdir" "$pkgdir/usr/share/$pkgname"
        ln -s "/usr/share/$pkgname/main.py" "$pkgdir/usr/bin/learnpdf"
}
