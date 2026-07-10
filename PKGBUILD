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
sha512sums=('963ab77591e30d2690195e7f1b810223f2ee4a5ec50c2bfac0d8e0a775596c78b102a136c0422e629a291ac6b4fafa3edf90e9746971e26abcc4f2f859e6d1c5')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
