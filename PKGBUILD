# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyminizip
pkgname=python-$_pkgname
pkgver=0.2.4
pkgrel=1
pkgdesc="Create a password encrypted zip file in python"
arch=('x86_64')
url='https://github.com/smihica/pyminizip'
license=('custom')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('347be4c47d7390fc3265a3ce774fd036d0c85cf1efc9bd1ba5a3b3d28e89b255')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
