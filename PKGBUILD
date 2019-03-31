# Contributor: Francois Boulogne <fboulogne@april.org>
# Contributor: David Wu <xdavidwuph@gmail.com>

pkgname=python2-pyocr
_pkgname=pyocr
pkgver=0.6
pkgrel=1
pkgdesc='Optical character recognition (OCR) tool wrapper for python'
arch=('any')
url='https://gitlab.gnome.org/World/OpenPaperwork/pyocr'
license=('GPL3')
depends=('python2-pillow' 'tesseract')
makedepends=('python2' 'python2-setuptools')
optdeps=('cuneiform: alternativer OCR')
source=("${_pkgname}-${pkgver}.tar.gz::https://gitlab.gnome.org/World/OpenPaperwork/pyocr/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bef4b9ffd59f4e737d77654a8310f4e4b22225653f88d2e2ba4fbd2abc5eced3')


build() {
  cd "${_pkgname}-${pkgver}"
  make version
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:

