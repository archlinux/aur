# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-aiohttp-session
pkgdesc='Web sessions for aiohttp.web'
pkgver=2.10.0
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
source=(
  "https://files.pythonhosted.org/packages/source/a/aiohttp-session/aiohttp-session-$pkgver.tar.gz"
)
sha256sums=(
  '2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b'
)

build() {
  cd "aiohttp-session-$pkgver"
  python setup.py build
}

package() {
  cd "aiohttp-session-$pkgver"
  python setup.py install --skip-build --optimize=1 --prefix=/usr --root="$pkgdir"
}
