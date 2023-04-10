# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Co-Maintainer: Aditya Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=1.7
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('b82b6d63c6f7df67b7f67b0577691e09af99ddc5a04ac63231e95de320a3c143')
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
