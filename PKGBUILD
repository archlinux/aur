# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkwidgets' 'python2-ttkwidgets')
pkgver=0.9.0
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('dfa18ba4b18954ec213900afba37fded3a9a5f16b58ded4236fa8e0087bf7dd21ecf436dbd89cf00b62fbf02c46da5bc7a50ae51f9a90e3b1d25442f6557a3a7')
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
