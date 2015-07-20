# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-usbtmc-git
pkgver=0.6.r3.ga4c8970
pkgrel=1
pkgdesc="A Python USBTMC driver for controlling instruments over USB."
arch=('any')
url="https://github.com/python-ivi/python-usbtmc"
license=('MIT')
depends=('python' 'python-pyusb')
makedepends=('git')
provides=('python-usbtmc')

_gitroot='https://github.com/python-ivi/python-usbtmc.git'
_gitname='python-usbtmc'

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

