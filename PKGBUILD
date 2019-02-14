# Maintainer: GI_Jack <GI_Jack@hackermail.com>
_pkgname=avalon_framework
pkgname=python-avalon_framework
pkgver=1.5.3
pkgrel=1
pkgdesc="Avalon Framework is a library that can make python printing in Linux much easier."
arch=('any')
url="https://github.com/K4YT3X/AVALON"
license=('LGPLv3')
depends=('python')
makedepends=('python')
source=("https://github.com/K4YT3X/AVALON/archive/${pkgver}.tar.gz")
sha256sums=('dcb6c04e6c9aae642270886cd75b6166d037d67477eed8fb1478075dc9663b69')

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

