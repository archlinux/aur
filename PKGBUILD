# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-core
_name=${pkgname#python-}
pkgver=0.3.221
pkgrel=1
pkgdesc="Core helpers for ComfyUI workflow templates."
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('367cf8cad701185c1dc159bc0c62656c9b9189532c4ae750e2650e81850781669fa5dbf1236c2cdcd386444bfa0b8723066f2e38c8987ae5af47b61b145e2b5d')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
