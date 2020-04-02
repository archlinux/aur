# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
pkgver=0.2.6
pkgrel=4
pkgdesc="Automatically crops the margins of PDF files"
arch=('any')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'ghostscript' 'poppler')
url="https://pypi.org/project/pdfCropMargins/"     
license=('GPL')
source=("https://files.pythonhosted.org/packages/c2/33/622baca4910c48c9d4b29d804b4690389dff6b0d6730d31a7b4d9ed9fd66/$PkgName-$pkgver.tar.gz"
        "pdfcropmargins.install")
md5sums=('ec662f0d5ebc99a9d97a63526fefbbfd'
         '9b69f16be9c0ae096f9a00469cd746e1')
install=${pkgname}.install

build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
