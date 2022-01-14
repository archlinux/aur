# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
pkgver='1.5.0'
pkgrel=1
url="https://github.com/tensorflow/metadata"
pkgdesc="Utilities for passing TensorFlow-related metadata between tools"
depends=('absl-py'
         'python-googleapis-common-protos'
         'python-protobuf')
makedepends=('python-setuptools'
             'python-wheel')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/81/e6/193d9637b844f88797199fced0e3baa893dd110bdca34b5708b49120ae30/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('982aa5715a306c5fcce0817da49ad0892f5d977db37e1811c34013ba4da06207')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
