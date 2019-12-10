# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=lavacli
pkgver=0.9.9
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('45b7a7ca29f7a875a000c4f033714dacafb7b36122828cfc4ac212ec01a24d95')
depends=(python)
makedepends=(python-setuptools)

build() {
  cd "lavacli-v${pkgver}"
  python setup.py build
}

package() {
  cd "lavacli-v${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
