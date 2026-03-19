# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-xgrammar
_pkgname=xgrammar
pkgver=0.1.32
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
source=("${_whl}::https://files.pythonhosted.org/packages/dc/bc/4ff87fbf59a4abd272325d3489ac5aa599bacd8b01ea09fec2ca84eece14/${_whl}")
sha256sums=('7f740ba83b69abb423167a5d5b13a9fcde89747220e191f6a004fae4a834311f')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
