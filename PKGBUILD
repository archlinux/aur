# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-assets-01
_name=${pkgname#python-}
pkgver=0.1.47
pkgrel=1
pkgdesc="Media assets bundle 01 for ComfyUI workflow templates"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('25b4d79c56f6b4c01ce7537db173a1729d6811542bb5a62b6bd10665b5d26baab688fb80ed349ea0b5735418d3ce0998f6df71cfa39f9e82cdae0dab38b1d17b')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
