# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pyusb-git
pkgver=1.0.0b2.r52.g39816be
pkgrel=1
pkgdesc="Easy USB access from Python"
arch=('any')
url="http://sourceforge.net/apps/trac/pyusb/"
license=('BSD')
depends=('python' 'libusb')
makedepends=('git')
provides=('python-pyusb')

_gitroot='https://github.com/walac/pyusb'
_gitname='pyusb'

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

