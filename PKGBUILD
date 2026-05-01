# Maintainer: lalala <lalala_233@qq.com>
pkgname=python-comfy-aimdo
_name=${pkgname#python-}
_py=cp39
pkgver=0.3.0
pkgrel=2
pkgdesc="AI Model Demand Offloading Allocator"
arch=('any')
url="https://github.com/Comfy-Org/comfy-aimdo/"
license=('GPL-3.0')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')

_filename=${_name//-/_}-$pkgver-$_py-abi3-manylinux1_x86_64.manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_5_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_filename}")
noextract=("${_filename}")
sha512sums=('2907f583895c7a23403258c76ecc95f861cee01bd2bbc4f0cdc76488760a8005360484dce21f14ad2206bcfe9668602362b52b6008c7982cca9940354af3ca1a')

# build() {
  # export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_COMFY_AIMDO=${pkgver}
  # cd ${_name}-${pkgver}
  # python -m build --wheel --no-isolation
# }

package() {
  # cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_filename}
}
