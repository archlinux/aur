# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gnome-appfolders-manager
pkgver=0.2.1
pkgrel=1
pkgdesc="Manage GNOME Shell applications folders."
url="http://www.muflone.com/gnome-appfolders-manager"
arch=('any')
license=('GPL2')
depends=('gtk3' 'python2-xdg' 'python2-gobject')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4dcdfaac1389d012d1329ed91942e0bcac3732cfa64323f8c8a3b9a6b8094d0d')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}
