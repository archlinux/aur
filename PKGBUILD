# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_cost_history
_name=trytond_product_cost_history
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to historize product cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e30035cb5a2a2ff219b4df6624535b57d8fc171ca239ea68d2978d2bbca82f1a')
sha512sums=('2de6b102793f2331df57816d2fa9a807e96500610d516f70f4b64aab8aa0343fe378b7e21bce47e2f7b4627e9e1d04bf1a58992ed9299138c450b9888928a81f')
b2sums=('ac2025b1139b3b5f8a4034bb1c830e7aeedb4e5d4f0d1a666b9b1ab22fd12a2b84d7b336191fd6a8be90baa4fabcf9a7a4aaef879235153289b75c8ebcd207af')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
