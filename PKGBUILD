# Maintainer: Your Name <youremail@domain.com>
_pkgname=AVALON
pkgname=python-avalon
pkgver=1.4
pkgrel=1
pkgdesc="Avalon Framework is a library that can make python printing in Linux much easier."
arch=('any')
url=""
license=('LGPLv3')
groups=('K4YT3X')
depends=('python')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/K4YT3X/AVALON/archive/${pkgver}.tar.gz")
sha256sums=('c08621b4754736218a665b83c142d65aa53481995ff0199556d594f3800fd983')

_pyver=$(pacman -Q python | cut -f 2 -d " " |cut -d "." -f 1,2)

build() {
  cd "$_pkgname-$pkgver"
  python -m compileall .
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm644 "__init__.py" "${pkgdir}/usr/lib/python${_pyver}/avalon_framework/__init__.py"
  cp -ra "__pycache__" "${pkgdir}/usr/lib/python${_pyver}/avalon_framework"
}

