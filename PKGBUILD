# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_production_work
_name=trytond_production_work
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for production work"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4983deceb1f5ecf6a260c8f6edc89f4a6dd8c10bbf231a9369ba5a66de92fedd')
sha512sums=('85b516292baac057379385d62754deffeb51677e4bc41adbd4aa60b0f5377b33d5108cb0a5d66f078f8563c0e228fdd049e1415ccec1641a314b244495f5063b')
b2sums=('bd420d5ab2c59a7d1cc596acfe31dd240adcab41f0164b4cdeb6bd1e7ecf423b61b4e7811d02c5a2131eec08975d770030a2eed19ea4f61fdb370a8b9f981f48')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
