# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=pyminizip
pkgname=python-$_pkgname
pkgver=0.2.5
pkgrel=1
pkgdesc="Create a password encrypted zip file in python"
arch=('x86_64')
url='https://github.com/smihica/pyminizip'
license=('custom')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('95c3cb3ad838e1374534c8c3a4408e44eccc06598730c095de338d814fe09ccf')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
