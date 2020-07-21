# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
PkgName=pdfCropMargins
pkgver=0.2.8
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
depends=('python-setuptools' 'python-wheel' 'python-pysimplegui' 'python-pymupdf' 'python-pypdf2' 'ghostscript' 'poppler')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/e5/13/3528e5efef1e4b927d59040dccda5453dc54692d824250c1ba348da1d7af/$PkgName-$pkgver.tar.gz")
md5sums=('7622b45ae6104372fbb694d876dad4f0')


build() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$PkgName-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
