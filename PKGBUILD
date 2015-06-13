# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

pkgname=gextractwinicons
pkgver=0.4.1
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="http://www.muflone.com/gextractwinicons"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject' 'gtk-update-icon-cache' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('52a3ad3ce477a9c6b9165d47510af238')
sha1sums=('f298d71b380a36609c0a111f45c51b0c52595e38')
sha256sums=('29c74add9595c4ab40af7a2fad643c875bd9a9a80061c7af03724aa58f31839e')
install="${pkgname}.install"

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

