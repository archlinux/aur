# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_product_customer
_name=trytond_sale_product_customer
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to manage customer product on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('98a2209e669076898eebba6415a303eedfd200ecb407d1eddff04f0fef2e5fcd')
sha512sums=('88ef8d339c36488dc58c5c9bff57836c870a522b32bc263114147acc2eba78e31288cf1f22dfc666311b8179a62a0ace62b28ead29bf591e24ff8b63182276ac')
b2sums=('83d8e9201f3816da178807643218f02c8cced62b23f95ece48cb1df8cfb140558ef0e89fb0d91cc731ddd8f3988d7a8c4f1754b44f5c91e65854d0b163c3105e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
