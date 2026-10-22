# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-xgrammar
_pkgname=xgrammar
pkgver=0.2.7
pkgrel=1
pkgdesc='Efficient, Flexible and Portable Structured Generation'
arch=('x86_64')
url='https://xgrammar.mlc.ai/'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-pytorch'
  'python-transformers'
  'python-pydantic'
  'python-numpy'
)
makedepends=('python-installer')
options=('!strip')
_pytag="cp$(python -c 'import sys; print(f"{sys.version_info[0]}{sys.version_info[1]}")')"
_whl="${_pkgname}-${pkgver}-${_pytag}-${_pytag}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
noextract=("${_whl}")
source=("${_whl}::https://files.pythonhosted.org/packages/aa/d1/8f50654de9b7e84dde654353f603e18477622997911e823598b1b528e499/${_whl}")
sha256sums=('ebb521bcce85dc832b0e5d21fe0acfea0641fdd66baa2c3295600ea22780582d')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
