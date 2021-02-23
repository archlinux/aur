# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_timesheet
_name=trytond_timesheet
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with timesheets"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('73974cd78b9bf4eeaa88b892b93f2dad48c30527f460322f4e2829fff572f6ad')
sha512sums=('aa7e191ba41a991343d46b4fde4b2e66d188a2cb7f5f1e227bcab647575ebe5a06684558da95ac99ddf3ef7f88411507e2cd8b5eff1a5983be2991e41b3253c1')
b2sums=('d8c28c1fae987cc080ccb3ea88499269707ff23436e1509d2272038a26615d7019a87e8c092f3e22d47d9924061fdb6aae9748bcbaf238e05be5ecbd98c9038b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
