# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-ivi-git
pkgver=0.14.9.r0.g7edbd63
pkgrel=1
pkgdesc="Python Interchangeable Virtual Instrument Library"
arch=('any')
url="https://github.com/python-ivi/python-ivi"
license=('MIT')
depends=('python' 'python-numpy')
makedepends=('git')
provides=('python-ivi')
optdepends=(
  'python-vxi11: VXI11 instrument support'
  'python-usbtmc: USBTMC instrument support'
  'python-pyvisa: PyVISA interface for NI drivers'
)

_gitroot='https://github.com/python-ivi/python-ivi.git'
_gitname='python-ivi'

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

