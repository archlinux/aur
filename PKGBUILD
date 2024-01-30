# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: AlphaJack <alphajack at tuta dot io>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.10.0
pkgrel=1
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
sha512sums_x86_64=('881b00912f209ff63d0a99215c5bf2a790175ae16eeef7ebc9310df20e0b5d69df2d2dc43b8d0df766719ad29df2257c7cb83ce43a3806584e8b7c8d3d94acb1')
sha512sums_aarch64=('00b7edcda221471d08673337184b1d8013898eda14511574769c166768a2bab1c486dcc456c34d1958d07928349565bf5c721abe3a39a43e0809dd901053d4b6')
sha512sums_i686=('8ec1af52c300de164c03ed8c958f280058853834f3207036d04bbe583c2070c7b341e76a014df0d08eb07d8aa75803bd4c18125c49c76bafc1ac0e880e88c3a7')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*${CARCH}.whl
}
