# Maintainer: quomoow <quomoow@gmail.com>
pkgname=gtk-doc-tools
_pkgname=gtk-doc
pkgver=1.25
pkgrel=1
pkgdesc="Generate API documentation from comments added to C code,typically 
used to document the public API of GTK+ and GNOME libraries."
arch=('any')
url="http://www.gtk.org/gtk-doc/"
license=('GPL')
depends=('python' 'bash')
source=(https://download.gnome.org/sources/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz)
md5sums=(0dc6570953112a464a409fb99258ccbc)

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
