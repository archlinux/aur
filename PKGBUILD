# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcolorpicker' 'python2-tkcolorpicker' )
pkgver=2.1.2
pkgrel=2
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
source=("tkcolorpicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('093a89217f8e3e8bb0263cd83fd01d15225dcc5b49446f9d9c04fd80bfd393728df421a2e790acb8029d11eadbfcf53c7da27c29383788bb0f9dcdfe39855a1b')
makedepends=('python-setuptools' 'python2-setuptools')

build() {
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python setup.py build
}

package_python-tkcolorpicker() {
  depends=('python' 'tk' 'python-pillow')
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-tkcolorpicker() {
  depends=('python2' 'tk' 'python2-pillow')
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
