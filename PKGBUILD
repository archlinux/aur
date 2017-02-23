# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-piexif
_pyname=Piexif
pkgname=('python-piexif' 'python2-piexif')
makedepends=('python' 'python2' 'python2-setuptools' 'python-setuptools')
checkdepends=('python-pytest' 'python2-pytest' 'python-pillow' 'python2-pillow')
pkgver=1.0.8
pkgrel=1
pkgdesc="Python library to read and write EXIF data from TIFF and JPG files"
arch=('any')
url="https://github.com/hMatoba/Piexif"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/hMatoba/Piexif/archive/${pkgver}.tar.gz")
sha512sums=('b19b7b8a6b6b3267c4e3daa068ce38dd5c39fdf390dc10e2ce692ee10b467f1df0b29f3f7e49b298e2ef58266bbdcef4aa380b459e7b01cc407b041cf1966022')

check(){
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py test
  python2 setup.py test
}
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
