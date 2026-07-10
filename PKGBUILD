# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-video
_name=${pkgname#python-}
pkgver=0.3.101
pkgrel=1
pkgdesc="Media bundle containing video workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('80381bbdbf674f5a7d51f39ed9f1149de76350837d5eefb3d06d9f312e228acda24b0e8cd2ef8be44718e3e8b0daec7c4fc38741c63ed53a2947d5d8f7f7c1e4')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
