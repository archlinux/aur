# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gnome-appfolders-manager
pkgver=0.2.4
pkgrel=1
pkgdesc="Manage GNOME Shell applications folders."
url="http://www.muflone.com/gnome-appfolders-manager"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1a543bc04422b28807779b16c56736a40fe36bed248061b4b216cde0dbcdf1c2')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
