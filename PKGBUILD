# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_marketing_automation
_name=trytond_marketing_automation
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgdesc="Tryton module to plan, coordinate and manage marketing campaigns"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('433aa5fbc59ace691e5be0ccca8c969b610048ac650737d51f36bb01e9cc9a51
6cbcc63ff7e638e39c844c6983871508a43322c675b5eef408edc8730605936f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
