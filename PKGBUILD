# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>

pkgname=python2-pyftdi-git
_pkgname=pyftdi
pkgver=v0.10.0.r0.g47eef7a
pkgrel=1
pkgdesc="PyFtdi aims at providing a user-space driver for modern FTDI devices, implemented in pure Python language."
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/eblot/pyftdi"
license=()
options=(!emptydirs)
source=(git+https://github.com/eblot/pyftdi.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim: ft=sh ts=2 sw=2 et
