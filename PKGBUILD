# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-kitchen
_name=${pkgname#python-}
pkgver=0.2.16
pkgrel=1
pkgdesc="Fast kernel library for Diffusion inference with multiple compute backends."
arch=('any')
url="https://github.com/Comfy-Org/comfy-kitchen"
license=('MIT')
depends=('python' 'python-pytorch')
provides=('python-comfy-kitchen')
conflicts=('python-comfy-kitchen-cuda')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename=${_name//-/_}-$pkgver-py3-none-any.whl
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
noextract=("${_filename}")
sha512sums=('1d6e03391782889e0d7be37c78702aa1ba6c92f396d51120cb1af05db0bd3818e022298dfa63587fd456dc146dbe139d361241871a02519dc60183b76a6a9dd5')

# build() {
#   cd ${_name//-/_}-${pkgver}
#   python -m build --wheel --no-isolation
# }

package() {
  # cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_filename}
}
