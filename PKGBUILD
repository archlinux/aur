# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-xgrammar
_pkgname=xgrammar
pkgver=0.1.33
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
source=("${_whl}::https://files.pythonhosted.org/packages/fa/c5/64558fd11130624267f788be5d665f898f627b87c6916b523c6e0d4cebf9/${_whl}")
sha256sums=('776a15eaadda463987fba97d8a07b60c262c96353d800fc8639efedb57b7cbbb')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
