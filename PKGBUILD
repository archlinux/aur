# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=lavacli
pkgver=1.1
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('4f7e70330b32d0e0a0613c5bf6525c67982666bc5c817dd14d52ab72aaa28561')
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
