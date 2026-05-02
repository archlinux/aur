# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-embedded-docs
_name=${pkgname#python-}
pkgver=0.4.4
pkgrel=1
pkgdesc="ComfyUI help pages"
arch=('any')
url="https://github.com/Comfy-Org/embedded-docs/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('d39554af6b9aefe1221a138825d938b16230b722febafe54090ae10919bc677c066ab3d810d7340823ebf0d3e25bc3424a76d4a1a2e9aff98546a5258307d8bd')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
