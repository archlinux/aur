# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-embedded-docs
_name=${pkgname#python-}
pkgver=0.5.6
pkgrel=1
pkgdesc="ComfyUI help pages"
arch=('any')
url="https://github.com/Comfy-Org/embedded-docs/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('d196a3c04101c40d2c3cb9deca4609e79ada55c577a72d0fb1dc3b814f2ed49f867a3768662cec1d60a52db60de843031c22b024c9f7cb301308712ff8ae25eb')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
