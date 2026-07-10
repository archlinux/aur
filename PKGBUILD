# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-json
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Workflow template JSON definitions for ComfyUI"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('e73fad9bbb5df08330923ded30ecc73b39cb24702b30686cae86566a70d03e16e9763d9ed1f20f7175f4174c8da825edf72e639d59278137f5a4e39b70f6eb16')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
