# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkwidgets' 'python2-ttkwidgets')
pkgver=0.10.0
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('27b5095053e6ff38a64c39b7fce7814b7188d1accb847fca1eb08f554b9ef83ed71255887bb22a0e5798d0393080e7707e00d88b2f4a8241e317371abcf03903')
makedepends=('python-setuptools' 'python2-setuptools')

build() {
    cd "$srcdir/$_name-${pkgver}"
    python setup.py build
}

package_python-ttkwidgets() {
	depends=('tk' 'python-pillow')
    cd "$srcdir/$_name-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}

package_python2-ttkwidgets() {
	depends=('tk' 'python2-pillow')
    cd "$srcdir/$_name-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
