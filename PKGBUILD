# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainers:
# - Eric Engestrom <aur [at] engestrom [dot] ch>
# - Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=2.8
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('ced3660dca7bfa82cbb727ee60955a12191e60f76c9776761f65d25b81613b4a')
depends=(python python-{aiohttp,yaml,pyzmq,voluptuous,ruamel-yaml})
makedepends=(python-setuptools python-pip)

build() {
  cd "lavacli-v${pkgver}"
  python setup.py build
}

package() {
  cd "lavacli-v${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
