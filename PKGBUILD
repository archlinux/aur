# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkthemes')
pkgver=3.1.0
pkgrel=1
pkgdesc="Group of themes for the ttk extenstions for Tkinter "
_name=ttkthemes
arch=('any')
url="https://github.com/TkinterEP/ttkthemes"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('dd10b86c632556cedb27b0cb14ebbcaa256748d519683d77f3d90e6d54ea678d7fed29e80dec908cd4ea42b01dd3a89f4b55d52807ddd6051a911cfb83e8fbc4')
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
