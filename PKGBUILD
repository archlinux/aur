# Maintainer: piernov <piernov@piernov.org>

pkgname=python-neptune-client
pkgver=0.11.0
pkgrel=1
pkgdesc="Neptune Client"
arch=('x86_64')
url="https://github.com/neptune-ai/neptune-client"
license=('APACHE')
depends=('python-bravado' 'python-click' 'python-future' 'python-oauthlib' 'python-pandas' 'python-pillow' 'python-pyjwt' 'python-requests' 'python-requests-oauthlib' 'python-six' 'python-websocket-client' 'python-gitpython' 'python-boto3' 'python-urllib3' 'python-psutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neptune-ai/neptune-client/archive/refs/tags/$pkgver.tar.gz")
md5sums=('55d59cf443dc5c87240a73c30d0bcab7')

build() {
  cd "$srcdir"/neptune-client-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/neptune-client-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}
