# Maintainer: David Göransson <david.goransson90@gmail.com>

pkgname=lifx-cli-git
_pkgname="lifx-cli"
pkgver=v1.2.r0.gdeabe9c
pkgrel=3
pkgdesc="Command line interface for LIFX light bulbs written in Python 3"
arch=(any)
url="https://github.com/Rawa/lifx-cli"
provides=('lifx')
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-setuptools'
)
conflicts=()
source=("${_pkgname}::git+https://github.com/Rawa/lifx-cli.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --root="$pkgdir/"
}
