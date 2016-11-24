# Maintainer: Larry Hajali <larryhaja[at]gmail[dot]com>

pkgname=python2-dex
_pkgname=Dex
pkgver=0.6
pkgrel=1
pkgdesc="A MongoDB performance tuning tool that compares queries to the available indexes in the queried collection(s) and generates index suggestions based on simple heuristics."
arch=('i686' 'x86_64')
url="https://github.com/mongolab/dex"
license=('MIT')
depends=('python2>=2.7' 'python2-pymongo' 'python2-yaml' 'python2-dargparse')
source=("https://pypi.python.org/packages/cd/f4/46dd14cd7787b66f69b02cb5771247eaf6078913a5dccbff0f0ce0825bdb/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e806ac09cca481a0bc67f71c43ce313e3e7276ca8c444eb49af4fa620f96ee70')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
