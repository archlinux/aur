# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-xgrammar
_pkgname=xgrammar
pkgver=0.2.3
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
source=("${_whl}::https://files.pythonhosted.org/packages/fb/9f/6c8601fa55545fdf9b9c95e289fc6db73b0c160759873f666a992741069d/${_whl}")
sha256sums=('f26c8bb1845119856b09658bcf2ee525957dc618d954684e5c393d16bcc1f1da')

package() {
  python -m installer --destdir="${pkgdir}" "${_whl}"
}
