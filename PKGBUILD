# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-assets-01
_name=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc="Media assets bundle 01 for ComfyUI workflow templates"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('af09a992dfa214717a7be3dd18f52bdc08e4db113e6a16f34361737f22372415e2cc5101eb3d185471b69c80f348f1e0c8a6062a892434a2a567e690f05504df')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
