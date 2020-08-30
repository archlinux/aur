# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-clyther
pkgver=0.4.0_beta
_mypkgver=${pkgver/_/-}
pkgrel=3
pkgdesc="A python language extension intended to make writing OpenCL code easy"
arch=('i686' 'x86_64')
url="https://srossross.github.io/Clyther/"
license=('Apache')
depends=('python-numpy' 'python')
makedepends=('python-setuptools')
source=( https://github.com/srossross/Clyther/archive/$_mypkgver.tar.gz ) 
md5sums=('79ffc1dcd8c30e89691bdb9912507f2f')

build() {
   cd ${srcdir}/Clyther-$_mypkgver
   2to3 . | patch -p0
   python setup.py build
}

package() {
   cd ${srcdir}/Clyther-$_mypkgver
   python setup.py install --root=${pkgdir}
}
