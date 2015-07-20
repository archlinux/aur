# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pyvisa-git
pkgver=1.7.r7.g22a9228
pkgrel=1
pkgdesc="A Python package with bindings to the 'Virtual Instrument Software Architecture' VISA library"
arch=('any')
url="https://github.com/hgrecco/pyvisa"
license=('MIT')
depends=('python' 'python-distribute' 'python-docutils')
makedepends=('git')
provides=('python-pyvisa')
optdepends=(
  'python-pyvisa-py: Pure Python backend'
)

_gitroot='https://github.com/hgrecco/pyvisa.git'
_gitname='pyvisa'

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

