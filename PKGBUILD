# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_analytic_purchase
_name=trytond_analytic_purchase
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add analytic accounting on purchase"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa0a1bc3a860f021cfa101e2a39ff2543c15eebb52b76173b8f910213eb7b365')
sha512sums=('0020d9a4fbf13f874fd0866715d6c533a24b8aadcfb1d447971a01bf9ab0d5c3ff6f489fc9639dc45860c5e867bac440594345d2dc538d2486a222e30d550337')
b2sums=('49c0b0a55957c018e7d3142ce01132623f817d87027b013cb320f01d6f0bc10b07312bf0626c74c26262fa53599dc8d8859eefa71c1aa49916ea105f62632b97')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
