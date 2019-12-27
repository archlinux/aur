# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python2-ttkwidgets')
pkgver=0.11.0
pkgrel=1
pkgdesc="Collection of widgets for Tkinter's ttk extensions"
_name=ttkwidgets
arch=('any')
url="https://github.com/RedFantom/ttkwidgets"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('5598e048b9a324bc2fad28a45aef9bebf7f784143090f541625d63d99b351ba6c0d2352100a5a03597b8df8a92aacbf6e2fe35a865a4377ddc689d3144f8ea8d')
makedepends=('python2-setuptools')
depends=('tk' 'python2-pillow')

build() {
    cd "$srcdir/$_name-${pkgver}"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_name-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
