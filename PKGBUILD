# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkthemes')
pkgver=3.0.0
pkgrel=1
pkgdesc="Group of themes for the ttk extenstions for Tkinter "
_name=ttkthemes
arch=('any')
url="https://github.com/TkinterEP/ttkthemes"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('dce673513d4ac1a2612d5eefd0a793410f2f34f2cb886cff82b382d902ecf0323679e6a38573582dc9f5bdd10e139ec7632d9a7f9b2ffa3f920b5c38b1c3256d')
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
