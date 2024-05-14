# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Co-Maintainer: Aditya Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=2.2.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('d7093bf4e80564ecf28aa7a2ffa2a22f52934624a955e1e2615121e330fb5cc9')
depends=(python python-{aiohttp,yaml,pyzmq,voluptuous})
makedepends=(python-setuptools python-pip)

build() {
  cd "lavacli-v${pkgver}"
  python setup.py build
}

package() {
  cd "lavacli-v${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
