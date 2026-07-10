# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates
_name=${pkgname#python-}
pkgver=0.11.1
pkgrel=1
pkgdesc="ComfyUI template workflows"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=(
  'python'
  'python-comfyui-workflow-templates-core'
  'python-comfyui-workflow-templates-json'
  'python-comfyui-workflow-templates-media-api'
  'python-comfyui-workflow-templates-media-assets-01'
  'python-comfyui-workflow-templates-media-image'
  'python-comfyui-workflow-templates-media-other'
  'python-comfyui-workflow-templates-media-video'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('33a2fb3e57c1838229cde750a0cd3dcac67249ecfbcf3d24c07b70e43e55fb8f9ecab337ce739d4a18b5de32698200b34a4a2ced68077207e9f613e2c64cda5b')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
