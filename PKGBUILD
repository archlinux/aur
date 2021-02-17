# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_amendment
_name=trytond_purchase_amendment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to amend purchases"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7c0cadf3f94697652232fbbbd7cb3d235ab9abd70c8647f56b39911487212343')
sha512sums=('35ae3766bb2cd95976328896c1cca85f06e909275b510ed42d31aa976724be6774be4012660cd1237a899998a663fcfe011ee8950c2b5025d158a65c5f0507d6')
b2sums=('798727e17dad25cfacf9b779b8b0684169664b723cac2dfa35f702648b05b08cd2789d8a9e2cd15195c04f36417cb2130e350760f67690c93590b4b12e44e449')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
