# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_credit_limit
_name=trytond_sale_credit_limit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale credit limit"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('de6e106fa6018ab7ad4e7185ecb4be06ca1c005340b572d5bab0656ab8445a96')
sha512sums=('b3e08abe2e87935c7af4f494fb497c9459bde0abdb5c6dcf2a6ca4cd15aa398c340220937b2e927f7023e24b1a7d0355764ddd88c8edc505e7eae70ddc2950eb')
b2sums=('2b1aecafc3cc2e14be2d86a51a1d7ec5b6c6c927285a16393ba734eb085dc4524fb81e1a99c1e83c8131c1968ba63666089d34f70a2dc995285e861ac6947d35')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
