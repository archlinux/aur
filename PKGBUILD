# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python2-pyocr
_pkgname=pyocr
pkgver=0.5.1
pkgrel=1
pkgdesc='Optical character recognition (OCR) tool wrapper for python'
arch=('any')
url='https://github.com/jflesch/pyocr'
license=('GPL3')
depends=('python2-pillow' 'tesseract')
makedepends=('python2' 'python2-setuptools')
optdeps=('cuneiform: alternativer OCR')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jflesch/pyocr/archive/${pkgver}.tar.gz")
sha256sums=('9e556d04aff8a6a4a0aef4c0dda7bb1227342634579c1268c300e663c995de12')


build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:

