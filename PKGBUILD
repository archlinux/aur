# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-video
_name=${pkgname#python-}
pkgver=0.3.83
pkgrel=1
pkgdesc="Media bundle containing video workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('bff2b6cae0a2a08ceb6edf9a6442c6c4c45f34880e149d477951b0f4ff77ebde6481ff3634f09b545947994d1845edd8d383f155ea8cd30eadbc46c605d134c1')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
