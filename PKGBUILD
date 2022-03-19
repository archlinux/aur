# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=python-pyte-git
pkgver=r237.211541f
pkgver() {
    cd "pyte"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Simple VTXXX-compatible linux terminal emulator"
arch=('any')
url="https://github.com/selectel/pyte"
license=('LGPL3')
depends=('python')
makedepends=('git' 'python-distribute')
conflicts=('python-pyte')
source=("git+https://github.com/selectel/pyte.git")
sha256sums=('SKIP')

build() {
  cd pyte
  python setup.py build
}

package() {
  cd pyte
  python setup.py install --root="$pkgdir" --optimize=1
}
