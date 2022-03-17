# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
pkgver='1.7.0'
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
source=("https://files.pythonhosted.org/packages/ed/c4/e4fa9d2725eff8eeed00f2c959d1cbb0a7f027f46ea36b9987b99d4e0d8c/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('d05600bf0f42371d3ebf12e4a431a16836c039918d24c4b9634235c9b8fc686a')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
