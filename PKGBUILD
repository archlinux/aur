# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_tasks
_name=trytond_tasks
pkgver=0.0.4
_pkgdir=0.0
pkgrel=1
pkgdesc="Run task for trytond"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9f8876e16c4013509efb759afd93d3f2ac50e24fc25aef15e872664b9f65967')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
