# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=pythondata-cpu-rocket
pkgname="python-$_srcname-git"
pkgver=2020.08.r1.gfe810b8
pkgrel=1
pkgdesc="Python module containing verilog files for rocket cpu (for use with LiteX)"
arch=(any)
url="https://github.com/litex-hub/pythondata-cpu-rocket"
license=('Apache')
depends=(python)
makedepends=(git python-setuptools)
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"
  python setup.py build
}

package() {
  cd "$_srcname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set et ts=2 syntax=PKGBUILD:
