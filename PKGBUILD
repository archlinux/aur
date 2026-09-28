# Maintainer: Javier Tia <floss@jetm.me>
# Old Maintainers:
# - Eric Engestrom <aur [at] engestrom [dot] ch>
# - Sirish <aditya [at] saky [dot] in>

pkgname=lavacli
pkgver=3.0.0
pkgrel=1
pkgdesc="Command line interface for LAVA"
arch=('any')
url="https://gitlab.com/lava/lavacli"
license=('AGPL3')
source=("$url/-/archive/v$pkgver/lavacli-v$pkgver.tar.gz")
sha256sums=('bb0ddacc19665625fe98cac963cd0aba8df63dd31f0f6410c8f625b69db8b0ad')
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
