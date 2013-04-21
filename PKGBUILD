# Maintainer: mutantmonkey <mutantmonkey@mutantmonkey.in>
pkgname=python2-sha3-git
_gitname=python-sha3
pkgver=22.2b7fd77
pkgrel=1
pkgdesc="A Python module that implements SHA-3 (Keccak) with a hashlib-like interface"
arch=('i686' 'x86_64')
url="https://github.com/bjornedstrom/python-sha3"
license=('PSF')
depends=('python2')
makedepends=('git' 'gcc')
provides=('python2-sha3')
conflicts=('python2-sha3')
options=(!emptydirs)
source=('git+https://github.com/bjornedstrom/python-sha3.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  python2 setup.py build
}

package() {
  cd $_gitname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
