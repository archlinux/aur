# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates
_name=${pkgname#python-}
pkgver=0.9.66
pkgrel=1
pkgdesc="ComfyUI template workflows"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python' 'python-comfyui-workflow-templates-core' 'python-comfyui-workflow-templates-media-api' 'python-comfyui-workflow-templates-media-image' 'python-comfyui-workflow-templates-media-other' 'python-comfyui-workflow-templates-media-video')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('26985de422425aa1194f09fceff0037cc3530401fcd3f851910ee438466c6363f16ecdcc45aad07ea4810d204a518efe39356dae3a2c0797b7e5824a0d11f901')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
