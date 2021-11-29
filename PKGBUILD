# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_metadata)
pkgver='1.4.0'
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
source=("https://files.pythonhosted.org/packages/03/4b/5ebc78654b002b880478b3211798bb4ff7b39c996d15a3340f732927149c/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('551f7193a2bd08d4f70c281ad0ba95d5055043fcace754ce5b8f45699fa8d09d')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
