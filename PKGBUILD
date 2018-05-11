# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-piexif
_pyname=Piexif
pkgname=('python-piexif' 'python2-piexif')
makedepends=('python' 'python2' 'python2-setuptools' 'python-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-pillow' 'python2-pillow')
pkgver=1.0.13
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://github.com/hMatoba/Piexif"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/hMatoba/Piexif/archive/${pkgver}.tar.gz")
sha512sums=('99f32cb55d6b4c34900075cd77c392ac916a96db058b142ed78bd79da502d12ff2b5ca74205b6d5abb424e044858d27e087438ccc6c005cdc18f22235bb93d02')

# Disabled because of not compatible API with python-pillow version > 4.0.0
#check(){
#  cd "${srcdir}/${_pyname}-${pkgver}"
#  python setup.py test
#  python2 setup.py test
#}

package_python-piexif() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-piexif() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
