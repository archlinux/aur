# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_invoice
_name=trytond_project_invoice
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to invoice projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('448752595b54d2970bb9546ae2303bf850cd310e89b3dcae7a59f2fd20c42d67')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
