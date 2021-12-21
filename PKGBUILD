# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyminizip
pkgname=python-$_pkgname
pkgver=0.2.6
pkgrel=1
pkgdesc="Create a password encrypted zip file in python"
arch=('x86_64')
url='https://github.com/smihica/pyminizip'
license=('custom')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0a954dd2a65fd72c8b827b83fb806fb4f301075a6ec43e207d3345ab15843a7a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
