# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pyvisa-py-git
pkgver=0.1.r64.gef0fc09
pkgrel=1
pkgdesc="A pure python backend for PyVISA"
arch=('any')
url="https://github.com/hgrecco/pyvisa-py"
license=('MIT')
depends=('python' 'python-pyvisa')
makedepends=('git' 'python-distribute' 'python-docutils')
provides=('python-pyvisa-py')

_gitroot='https://github.com/hgrecco/pyvisa-py.git'
_gitname='pyvisa-py'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

