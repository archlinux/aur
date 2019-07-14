# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_user_role
_name=trytond_user_role
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to manage role on user"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f79ec009d5a4d724325baad92cb64f60a4a6fb7fb1e3375ba43ed3439b0f1fa7')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
