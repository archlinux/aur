# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alessandro Pezzoni <alessandro_pezzoni@lavabit.com>

pkgname=gextractwinicons
pkgver=0.4.2
pkgrel=1
pkgdesc="Extract cursors and icons from MS Windows compatible resource files"
url="http://www.muflone.com/gextractwinicons"
arch=('any')
license=('GPL2')
depends=('gtk3' 'gobject-introspection' 'python2-xdg' 'python2-gobject'
         'gtk-update-icon-cache' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('723a7302479fc93ae264d774d23a3384')
sha1sums=('22b21560db7f500fad4a8907204b5171abec4d9b')
sha256sums=('9b126921d618add45c921b11e7f975c7f38d64d1be6d8e937aada5193ee25017')

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root "${pkgdir}"
}

