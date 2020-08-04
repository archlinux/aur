# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_subscription_asset
_name=trytond_sale_subscription_asset
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="A module to handle asset in the sale subscriptions"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f28e86a09c49cb43c798891b73c351b69fb188e41f58df95afeeb37ba9af0050')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
