# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname='python-tkcolorpicker'
pkgver=2.1.3
pkgrel=2
pkgdesc="Color picker dialog for Tkinter, alternative to tkinter.colorchooser."
url="https://github.com/j4321/tkColorPicker"
arch=('any')
license=('GPL3')
source=("tkcolorpicker-$pkgver.tar.gz::https://github.com/j4321/tkColorPicker/archive/v$pkgver.tar.gz")
sha512sums=('89b35a39a238456cfef2d9ff10eefa838570f1eb1de9b1b18f82d169705acd9a7341b7348cf79dfd97145bc43b4166e69937f32b294ec5d8b56c4cac0c43740a')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
depends=('python' 'tk' 'python-pillow')

build() {
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python setup.py build
}

check() {
    cd "${srcdir}/tkColorPicker-${pkgver}"
    pytest tests.py
}

package() {
  cd "${srcdir}/tkColorPicker-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
