# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates
_name=${pkgname#python-}
pkgver=0.11.66
pkgrel=1
pkgdesc="ComfyUI workflow templates package"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=(
  'python'
  'python-comfyui-workflow-templates-core'
  'python-comfyui-workflow-templates-json'
  'python-comfyui-workflow-templates-media-api'
  'python-comfyui-workflow-templates-media-assets-01'
  'python-comfyui-workflow-templates-media-assets-02'
  'python-comfyui-workflow-templates-media-image'
  'python-comfyui-workflow-templates-media-other'
  'python-comfyui-workflow-templates-media-video'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('1a5d8182834de40ed2eb89be52e9f8b1d1c2d10e87951b20f61784c1446c22f1383e2302f43691620db43f9aca88a4fab48a0ba62da19d07a3efff4727b347fc')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
