# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-aiohttp-session
pkgdesc='Web sessions for aiohttp.web'
pkgver=2.11.0
pkgrel=1
url='http://aiohttp-session.readthedocs.io/'
license=('Apache')
arch=('any')
depends=('python-aiohttp')
optdepends=(
  'python-aioredis: Redis session storage'
  'python-cryptography: store sessions in encrypted cookies'
  'python-aiomcache: Memcached session storage'
  'python-pynacl: NaCL encrypted JSON session storage'
)
makedepends=('python-setuptools')

_pypi=aiohttp-session
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4'
)

build() {
  cd "aiohttp-session-$pkgver"
  python setup.py build
}

package() {
  cd "aiohttp-session-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
}
