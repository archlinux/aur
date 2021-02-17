# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package_shipping_dpd
_name=trytond_stock_package_shipping_dpd
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="DPD connector for the Tryton application platform"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('adeeba3deb3c38872e26ab51a17dce13eff80eebf1dc8e48eed4b858f0748272')
sha512sums=('9f94e1dbadcb74ecd071369bc8db8e8737ab25b25e1d49db33e33b2510798288370076c8a68fd116ee3b7305a3921328654e918e0c8ddd87991e4e453bdfe851')
b2sums=('5ee30addc9e954c0a0b9dc24180db294238229aa8b7912ccebeb6e7ac29e9a55503804da0fb52dece7c5997fbea66fd7e05495579d6dbe799cc05831ffef205e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
