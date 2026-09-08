# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-xgrammar
_pkgname=xgrammar
pkgver=0.2.5.post1
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
source=("${_whl}::https://files.pythonhosted.org/packages/4c/f5/ad7c721dced10d85a2ba2edcbbc751e537e21ff420bad7f9d8808969bc00/${_whl}")
sha256sums=('604090ce51914414715a826f8c2e859756fbb29693b74916ce934d7f5978d5b0')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
