# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainers:
# - Eric Engestrom <aur [at] engestrom [dot] ch>
# - Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=3.1.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('4636cc008d58736246f6ac67c9b50770949cd312d680611c90e1a807230281c5')
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
