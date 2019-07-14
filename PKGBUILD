# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shortener
_name=trytond_web_shortener
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to plug a URL to an action"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5ae412213524243994c0a3df1393c977f12bdeb14c6e57ee0dd5e5fe563c681f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
