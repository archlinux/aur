# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkwidgets')
pkgver=0.10.1
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('d522743827fa2f949844d454cf80e324c16046fce619abde086be20392c8c186b31bfb609d85b1d6780685ca3f4df2e6a95ae3f5baa182fba64c4d3402b11fac')
makedepends=('python-setuptools')
depends=('tk' 'python-pillow')

build() {
    cd "$srcdir/$_name-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
