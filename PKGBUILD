# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

_pkgname="cram"
pkgname="python-cram"
pkgver=0.6
pkgrel=1
pkgdesc="A simple testing framework for command line applications"
arch=("any")
url="https://pypi.python.org/pypi/cram"
license=("GPL")
depends=("python")
options=("!emptydirs")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3808e3e7812c68ca962c4db9abac9069')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
