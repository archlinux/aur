# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
pkgver='1.8.0'
pkgrel=1
url="https://github.com/tensorflow/metadata"
pkgdesc="Utilities for passing TensorFlow-related metadata between tools"
depends=('absl-py'
         'python-googleapis-common-protos'
         'python-protobuf')
makedepends=('python-pip'
             'python-wheel')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/20/e7/b4dcc898ca1c250ff1f1e431a3fdd2b347663283e8aea282704d59e92ad9/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('65c47207efeaff6b514196d2d420dbb7762f0a07336e1798731f90c81541ab11')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
