# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=lavacli
pkgver=1.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('f04a51146f0042f653411e1bc8e194ee64f3a6eb882ba7b57078e5941b832665')
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
