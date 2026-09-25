# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-kitchen
_name=${pkgname#python-}
_py=py3
pkgver=0.2.35
pkgrel=1
pkgdesc="Fast Kernel Library for ComfyUI with multiple compute backends"
arch=('any')
url="https://github.com/Comfy-Org/comfy-kitchen"
license=('MIT')
depends=('python' 'python-pytorch')
provides=("python-comfy-kitchen=$pkgver")
conflicts=('python-comfy-kitchen-cuda')
makedepends=(python-build python-installer python-wheel python-setuptools)

_filename=${_name//-/_}-$pkgver-$_py-none-any.whl
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename}")
noextract=("${_filename}")
sha512sums=('cc103f9073ee2a8d780f36f49affe2109d4cedd5c4a9b3c2f84c82e074cf8c10d95af0f4d509667cce58a35cf31f2e43bddd2a59a35d6cf7ef0834e63aa80791')

# build() {
#   cd ${_name//-/_}-${pkgver}
#   python -m build --wheel --no-isolation
# }

package() {
  # cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_filename}
}
