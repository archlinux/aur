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
sha256sums=('c510014fede60498ff0a02d11137cdb253a1515e99bebc3bcb0d76c590758d91')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
