# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkthemes')
pkgver=3.2.0
pkgrel=1
pkgdesc="Group of themes for the ttk extenstions for Tkinter "
_name=ttkthemes
arch=('any')
url="https://github.com/TkinterEP/ttkthemes"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('0224c3fc8b00d0a177f7d2718855b2584aa6a11af69871364cb24cec57e9da1679aca2a3a7fa06e637071ef78a10c5075e92a68cbb12e3cd47d40ec6a19aaf45')
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
