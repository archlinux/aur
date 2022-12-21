# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru
# Contributor: Ianis Vasilev: ianis@ivasilev.net

pkgname=ocrodjvu-python3-git
pkgver=0.12
pkgrel=2
pkgdesc="Python 3 port of ocrodjvu. ocrodjvu is a wrapper for OCR systems, that allows you to perform OCR on DjVu files."
arch=('i686' 'x86_64')
url='https://github.com/rmast/ocrodjvu/tree/python3'
license=('GPL2')
provides=('ocrodjvu')
conflicts=('ocrodjvu')
depends=('python' 'python-lxml' 'python-djvulibre' 'python-future' 'python-regex')
optdepends=('python-html5lib: HTML parser; required for the ``--html5`` option'
            'python-pyicu: required for the ``--word-segmentation=uax29`` option'
            'cuneiform: OCR system' 
            'tesseract: OCR system'
            'ocrad: OCR system'
            'gocr: OCR system'
            'ocropy: OCR system')
source=(git+https://github.com/rmast/ocrodjvu#branch=python3)
sha512sums=('SKIP')

package() {
    cd "$srcdir/ocrodjvu"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
