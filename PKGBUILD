# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-image
_name=${pkgname#python-}
pkgver=0.3.133
pkgrel=1
pkgdesc="Media bundle containing image workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('75daa7db09713c842a56be2fb31b91952f9365474d0ebe1be0a001c37ef2addc7712579d4e4c659a201032d1f361fb1f5e435335bc1c72202c43edf32aa03097')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
