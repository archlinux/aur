# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-kitchen
_name=${pkgname#python-}
_py=cp312
pkgver=0.2.8
pkgrel=1
pkgdesc="Fast kernel library for Diffusion inference with multiple compute backends."
arch=('any')
url="https://github.com/Comfy-Org/comfy-kitchen"
license=('MIT')
depends=('python' 'cuda')
makedepends=(python-build python-installer python-wheel python-setuptools python-tomli nanobind)

_filename=${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_24_x86_64.manylinux_2_28_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename}")
noextract=("${_filename}")
sha512sums=('5ba882a2244e80d362b40281cd9e973ff8bbcce3988a257aaaa8a3ea1d50c63a2789e52f9d2fe5314a9da23def5c711b616e875eb093930e2e68c29c9364b535')

# build() {
#   cd ${_name//-/_}-${pkgver}
#   python -m build --wheel --no-isolation
# }

package() {
  # cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_filename}
}
