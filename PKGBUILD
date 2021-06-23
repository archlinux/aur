# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python2-clyther
pkgver=0.4.0_beta
_mypkgver=${pkgver/_/-}
pkgrel=3
pkgdesc="A python language extension intended to make writing OpenCL code easy"
arch=('i686' 'x86_64')
url="https://srossross.github.io/Clyther/"
license=('Apache')
depends=('python2-numpy' 'python2')
makedepends=('python2-distribute')
source=( https://github.com/srossross/Clyther/archive/$_mypkgver.tar.gz ) 
md5sums=('79ffc1dcd8c30e89691bdb9912507f2f')

build() {
   cd ${srcdir}/Clyther-$_mypkgver
   python2 setup.py build
}

package() {
   cd ${srcdir}/Clyther-$_mypkgver
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
