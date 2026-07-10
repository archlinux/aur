# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-image
_name=${pkgname#python-}
pkgver=0.3.160
pkgrel=1
pkgdesc="Media bundle containing image workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('3df9719faacca883a5d3b2b78cf32203492adf92bb6ae86f49285d4ab3ccfc9ffd0e9bab1eb09e27217ececd35506102e12cd045a96d8191988be7ad640bfbb3')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
