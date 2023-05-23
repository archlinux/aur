# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Co-Maintainer: Aditya Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=1.9
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://git.lavasoftware.org/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('62fcc512c5ad5dab69b635315ae2d13c47ca452189b860a9ffd35e867934a7e3')
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
