# Maintainer: Dmytro Meleshko <dmytro.meleshko@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mirage
pkgver=0.9.5.2
pkgrel=5
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=('GPL')
depends=('pygtk')
optdepends=('gnome-python: GNOME toolbar setting support')
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2
        mirage-0.9.5.2-setup.py.patch)
md5sums=('92191a4496b0a50486ed7299baf6729f'
         '9b54ee94338f6daf5e7e7926427040e4')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/mirage-0.9.5.2-setup.py.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py build
}
package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
