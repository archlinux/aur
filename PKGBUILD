# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python38-google-api-core
pkgver=2.10.2
pkgrel=1
pkgdesc="Google API client core library"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache')
depends=('python38-pytz' 'python38-requests' 'python38-googleapis-common-protos' 'python38-google-auth')
makedepends=('python38-setuptools')
optdepends=('python38-grpcio: for grpc support')
source=("https://files.pythonhosted.org/packages/source/g/google-api-core/google-api-core-${pkgver}.tar.gz")
sha256sums=('10c06f7739fe57781f87523375e8e1a3a4674bf6392cd6131a3222182b971320')

build() {
  cd "google-api-core-${pkgver}"
  python3.8 setup.py build
}

package() {
  cd "google-api-core-${pkgver}"
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  chmod -R a+r "$pkgdir"/usr/lib/python*/site-packages/google_api_core*.egg-info/
}
