# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-assets-02
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Media assets bundle 02 for ComfyUI workflow templates"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('a1a4fa3f662dcf5dfc8f2d8608e27729811d970937826d10d01344703a978e532c3341ffd03fe19efee65f628a1f3ecc17078871d27c019cfbb25db85203b012')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
