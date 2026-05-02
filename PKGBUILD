# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-workflow-templates-media-other
_name=${pkgname#python-}
pkgver=0.3.187
pkgrel=1
pkgdesc="Media bundle containing audio/3D/misc workflow assets"
arch=('any')
url="https://github.com/Comfy-Org/workflow_templates/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('696a7c3acfb3be045acefc2fd1cb8a974b8312001d962a09cdaec3a450128f04155493e303218845c2ceb2bb21ca4d774d5ec01ebdd644f75efc530c3ca2e73d')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
