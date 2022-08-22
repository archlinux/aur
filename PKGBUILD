# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

pkgname=gextractwinicons
pkgver=0.5.1
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="https://www.muflone.com/gextractwinicons"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'gettext')
depends=('gtk3' 'gobject-introspection' 'python-xdg' 'python-gobject' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3ba53fe556d179d0d3bd42deb9d345f7d0b53d75cdc6fbb498302f25cd896bc8')

build() {
  cd "${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python3 setup.py install --optimize=1 --root "${pkgdir}"
}

