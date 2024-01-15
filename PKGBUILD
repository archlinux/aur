# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: AlphaJack <alphajack at tuta dot io>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.9.1
pkgrel=2
arch=(x86_64 aarch64 i686)
url="https://github.com/grantjenks/py-${_base}"
license=(Apache)
depends=(python-tree-sitter)
makedepends=(python-installer)
provides=(python-${_base}=${pkgver})
conflicts=(python-${_base})
_pyversion=cp311 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
source_x86_64=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
source_aarch64=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_aarch64.manylinux2014_aarch64.whl)
source_i686=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_i686.manylinux2014_i686.whl)
sha512sums_x86_64=('4511e97630a0e063693142dbaef901273b794dc6822c1531d6424f50db737d7666b9a7e5fbd90f7675768c5e5c6c1f2cd364e00cef68ce55be9c103a969bf0af')
sha512sums_aarch64=('2ea2c41231b3f5b0b369204e9f86e788f559fa3b5f58fa930c8d12b6f83d05f13863d5822390c496000cc510c41e2f255ec656ed59c89f49ef22b1b2ac636124')
sha512sums_i686=('4d7846fde1903c930aaaf5a068cc4328181f5215d60db302dea33c9a770c426cd152a823e24aba146f196f4e6d9b4d22d5e4a859a1bd93c32d446feab9098e3d')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*${CARCH}.whl
}
