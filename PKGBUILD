# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfontchooser' 'python2-tkfontchooser')
pkgver=2.0.2
pkgrel=1
pkgdesc="Font chooser dialog for tkinter"
arch=('any')
url="https://github.com/j4321/tkFontChooser"
license=('GPL3')
source=("tkfontchooser-$pkgver.tar.gz::https://github.com/j4321/tkFontChooser/archive/v$pkgver.tar.gz")
sha512sums=('9ab8499da5deb964bec8e52cbb7d9eb9baff056aca3a9b7bbc3948b00b275a6cf48af5ed50d6f1dbc0560237d97decb6b3dae6038120d4e82f8773f3d9144f14')
makedepends=('python' 'python-setuptools' 'python2-setuptools')

build() {
	cd "${srcdir}/tkFontChooser-${pkgver}"
  python setup.py build
}

package_python-tkfontchooser() {
  depends=('python' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-tkfontchooser() {
  depends=('python2' 'tk')
  cd "${srcdir}/tkFontChooser-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

