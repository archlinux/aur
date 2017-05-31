# Maintainer: Guillaume Horel <guillaume.horel@gmail.com> 

pkgname=python-cachey
_pkgname=cachey
pkgver=0.1.1
pkgrel=1
pkgdesc="Caching based on computation time and storage space"
arch=('any')
url="https://github.com/dask/cachey"
license=('BSD')
depends=('python')
checkdepends=('python-heapdict' 'python-nose')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/dask/cachey.git#commit=6d4aca7")
sha256sums=('SKIP')


package(){
  cd "$srcdir/$_pkgname"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname"
  nosetests
}
# vim:ts=2:sw=2:et:
