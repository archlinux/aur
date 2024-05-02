# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: AlphaJack <alphajack at tuta dot io>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.10.2
pkgrel=2
arch=(x86_64 aarch64 i686)
url="https://github.com/grantjenks/py-${_base}"
license=(Apache)
depends=(python-tree-sitter)
makedepends=(python-installer)
provides=(python-${_base}=${pkgver})
conflicts=(python-${_base})
_pyversion=cp312 # $(python -c "import sys; print(f'cp{sys.version_info.major}{sys.version_info.minor}')")
source_x86_64=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl)
source_aarch64=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_aarch64.manylinux2014_aarch64.whl)
source_i686=(https://pypi.org/packages/${_pyversion}/${_base::1}/${_base}/${_base//-/_}-${pkgver}-${_pyversion}-${_pyversion}-manylinux_2_17_i686.manylinux2014_i686.whl)
sha512sums_x86_64=('cacfa220609eaec5a7994bdfd05e69a0c676cb2fa3f4c7e1d8e0be51b6a836b4e9262265b2b4c54804eaf7a265a1cc4faf377095513054f04c1adbb5e7f70b0c')
sha512sums_aarch64=('1582a497221667071148b016a4cd00d552eec57a4ee7e6398fb92cc0a9584ae68ae6cb0d8b03dd72c78b05056edbeb370e307be22423d61670a61536d42379c2')
sha512sums_i686=('ef578b3db78a556af622bf23d17df29d17bbb7898a1ff7449a5d0504b09c39bd064ebf59f98f1c09f5db0350088f38720bd79c5db3c1a3bf697cae3b321c9a34')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*${CARCH}.whl
}
