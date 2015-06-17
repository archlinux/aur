# Maintainer: Quan Guo <guotsuan at gmail dot com>

pkgname=python-llvmlite-git
pkgver=0.4.0.r70.g423d5a3
pkgrel=1
pkgdesc="A lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'llvm')
makedepends=('git' 'cython')
provides=('python-llvmlite')
conflicts=()
replaces=()
backup=()
source=(git+https://github.com/numba/llvmlite.git#branch=llvm3.6)
md5sums=('SKIP')

_gitname=llvmlite

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install \
    --prefix=/usr \
    --root=$pkgdir
}
