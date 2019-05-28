# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcolorpicker' 'python2-tkcolorpicker' )
pkgver=2.1.3
pkgrel=1
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
source=("tkcolorpicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('89b35a39a238456cfef2d9ff10eefa838570f1eb1de9b1b18f82d169705acd9a7341b7348cf79dfd97145bc43b4166e69937f32b294ec5d8b56c4cac0c43740a')
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
