# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=lavacli
pkgver=1.6
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('159431c2c976488124c2d1edc5a5a3ff8680b445d295dc9c3db3a91321f869c8')
depends=(python python-{aiohttp,jinja_pluralize,yaml,pyzmq})
makedepends=(python-setuptools python-pip)

build() {
  cd "lavacli-v${pkgver}"
  python setup.py build
}

package() {
  cd "lavacli-v${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
