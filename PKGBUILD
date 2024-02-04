# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: AlphaJack <alphajack at tuta dot io>
_base=tree-sitter-languages
pkgname=python-${_base}-bin
pkgdesc="Python Bindings for Tree Sitter with All Languages"
pkgver=1.10.2
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
sha512sums_x86_64=('e1ddca7f00448e4294dad30e4cc806a5951757515dc8d3b31009a0c30cdc103d202d9f52d56658370eadd327f1af6b2e3838df6081c59d294d3f5e2c861053ee')
sha512sums_aarch64=('d90eef0110ef13c303af87990aa452f97a371635e5daef73c6aec42f79ac220f02c0433d072d8951e4ef9e460f117d440c5b8dee658a66a6cd769ba328bdbbe5')
sha512sums_i686=('f674c8885ed067a285720c8ad0b04f69d96ba48281490519e0a312775bf29935c5f0b4fa2539bc17bfa1b263e42b8ccac3b2b1191d0a93270af756da6042040c')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ./*${CARCH}.whl
}
