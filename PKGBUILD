# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.19
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
#url="https://jelmer.uk/code/ognibuild"
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'python-buildlog-consultant'
  'python-requirements-parser'
  'python-ruamel-yaml'
  'python-setuptools'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'python-aiohttp-openmetrics'
  'python-apt'
#  'python-brz-debian'
  'python-debian'
  'python-debmutate'
  'python-lz4'
  'python-psycopg2'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jelmer/ognibuild/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04a167e20322387d5af077b66c76837a5491a1e21e77931566302e2067ed3080')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
