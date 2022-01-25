# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
pkgver='1.6.0'
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
source=("https://files.pythonhosted.org/packages/c7/4d/c1a509ea79857e5f4da30acbe6bf55294a24ad7388ab2842ba68192ca69c/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('44ef4279a83d13ff59557edb477edb4abc2a32b3c33188f5aa8061494d28594c')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
