# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-json
_name=${pkgname#python-}
pkgver=0.1.92
pkgrel=1
pkgdesc="Workflow template JSON definitions for ComfyUI"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('fae5c2126d44b6eaed1cef657ba24ae745e1cd4a1c28ed74ce08354fead6368a47950ab6460bff96ae50a34b3f6da08a1b9d9ca726dfe5fea2f8a691feba4361')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
