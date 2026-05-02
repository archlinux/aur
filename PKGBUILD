# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-api
_name=${pkgname#python-}
pkgver=0.3.73
pkgrel=1
pkgdesc="Media bundle containing API-driven workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('1961c961c92fc24cf76935b63806f13f91c098a8648d6f0e0aa6c17e198dac60efb1868213e460375cd9c689b566c3bb60eeacaa4b94500029d0f199bdc03aee')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
