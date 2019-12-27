# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-ttkthemes')
pkgver=2.4.0
pkgrel=1
pkgdesc="Group of themes for the ttk extenstions for Tkinter "
_name=ttkthemes
arch=('any')
url="https://github.com/TkinterEP/ttkthemes"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RedFantom/$_name/archive/${pkgver}.tar.gz")
sha512sums=('624ba23fac0ea294b7afea362285d7f4d93dccf59d8cbf47ee7194f0d2bf8482e314d4a33fe28dc4e51e39d0d053ff0f05190a15efa4731f0106a35db967b017')
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
