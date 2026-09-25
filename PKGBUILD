# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfyui-embedded-docs
_name=${pkgname#python-}
pkgver=0.5.12
pkgrel=1
pkgdesc="Embedded documentation for ComfyUI nodes"
arch=('any')
url="https://github.com/Comfy-Org/embedded-docs/"
license=('GPL-3.0')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha512sums=('6fc29f3f385de73a7b88a3e4b3da1b237994371f5647868f056c6cf7f0cffeeb6eef169a4e7a1fdbe9cf9a0ddbe3f2753726e25f6e33c9d1bf74e64d80b3a03c')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
