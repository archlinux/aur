# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python38-googleapis-common-protos
pkgver=1.56.4
pkgrel=1
pkgdesc="Python 3.8 classes generated from the common protos in the googleapis repository"
arch=('any')
url="https://github.com/googleapis/googleapis"
license=('Apache')
depends=('python38-protobuf')
optdepends=('python38-grpcio: for grpc support')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
source=("https://files.pythonhosted.org/packages/source/g/googleapis-common-protos/googleapis-common-protos-${pkgver}.tar.gz")
sha256sums=('c25873c47279387cfdcbdafa36149887901d36202cb645a0e4f29686bf6e4417')

build() {
  cd "googleapis-common-protos-${pkgver}"

  python3.8 -m build --wheel --no-isolation
}

package() {
  cd "googleapis-common-protos-${pkgver}"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  chmod -R +r "${pkgdir}"
}
