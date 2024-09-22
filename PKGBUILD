# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: bulletmark
# Contributor: Turtle Russ <tttturtleruss@gmail.com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=3.0.1
pkgrel=1
epoch=2
pkgdesc='Python library for manipulating pages of PDF files (legacy v2)'
arch=(any)
url="https://pypi.org/project/PyPDF2"
license=(BSD)
depends=(
  'python-typing_extensions'
  'python-pillow'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a74408f69ba6271f71b9352ef4ed03dc53a31aa404d29b5d31f53bfecfee1440')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package(){
  cd ${_name}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
