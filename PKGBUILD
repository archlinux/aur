# Maintainer: Quan Guo <guotsuan at gmail dot com>

pkgname=python2-numba-llvmlite-git
pkgver=0.18.2.r513.ge9c9566
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVMLITE, which is able to 
work with LLVM 3.5, rather than LLVMPY."
url="https://github.com/numba/numba"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'python2-llvmlite-git' 'python2-enum34')
makedepends=('git' 'cython2')
provides=('python2-numba')
conflicts=('python2-numba-git' 'python2-numba')
replaces=()
backup=()
source=(git+https://github.com/numba/numba.git)
md5sums=('SKIP')

_gitname=numba

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}
