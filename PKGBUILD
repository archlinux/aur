# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-other
_name=${pkgname#python-}
pkgver=0.3.229
pkgrel=1
pkgdesc="Media bundle containing audio/3D/misc workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('2ae55ed95d3d0b95e0f3ce5ddf0f3eba04d2b67d18d2600e0b2c54c8da1515034942091aae9f21c5f1ca4df446c8347104db71b35305d11830b3188ae2c65f7f')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
