# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-core
_name=${pkgname#python-}
pkgver=0.3.357
pkgrel=1
pkgdesc="Core helpers for ComfyUI workflow templates"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('b70670ae1a34c8571f5713f5a6ded79b6233d825d74e684f9ec93fb5d485bfabaebbe7b6c5eb67319b124489c8cbd403f328ee6e97b6b8dd4ad015efcefd10a2')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
