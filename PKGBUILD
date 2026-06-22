# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainers:
# - Eric Engestrom <aur [at] engestrom [dot] ch>
# - Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=2.9.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('1b25d18fc4075e5c1c938f798938c565b1d9a5e54938362e8ba4b1e5b621ff24')
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
