# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainers:
# - Eric Engestrom <aur [at] engestrom [dot] ch>
# - Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=3.2.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('6afd351eb6ad3243bd979ef0e3c221a008463cb162763f0cf4db55df9e205537')
depends=(python python-{aiohttp,jinja,requests,ruamel-yaml,voluptuous})
makedepends=(python-build python-installer python-setuptools python-wheel)

build() {
  cd "lavacli-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "lavacli-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
