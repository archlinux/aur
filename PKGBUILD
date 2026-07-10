# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-api
_name=${pkgname#python-}
pkgver=0.3.84
pkgrel=1
pkgdesc="Media bundle containing API-driven workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('770621eb18c55206afd8da80394c61edf016cbd1bccd28c4a80b1ccb7bcd51df3a80045e03e5b5460cf3856ba0a8dd26a2c7b5b89f5c2d295b5d865386dd3aa9')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
