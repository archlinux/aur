# Maintainer: Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Jorge <jorge.barroso.11@gmail.com>

pkgname=gimp-extras
_pkgname=gimp-data-extras
pkgver=2.0.4
pkgrel=1
_pkgrel=1
pkgdesc="The extra brushes and patterns from ubuntu"
arch=('any')
url="http://packages.ubuntu.com/search?searchon=names&keywords=gimp-data-extras"
license=('GPL2')
depends=('gimp')
# source=(http://de.archive.ubuntu.com/ubuntu/pool/universe/g/gimp-data-extras/gimp-data-extras_${pkgver}-${_pkgrel}_all.deb)
source=("https://download.gimp.org/mirror/pub/gimp/extras/gimp-data-extras-${pkgver}.tar.bz2")
sha512sums=('d80de250335b502d0187b0184b51d8e0192bbe4d376f64601ae0e0c0350a50e99bc431272bddfdb94ff18ea52ecdd6d29ff28d61d39c1e009d026e1cde772672')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
#   tar -xf data.tar.xz
#   install -m755 -d "${pkgdir}/usr/"
#   cp -r "${srcdir}/usr/" "${pkgdir}"
#   sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/doc/gimp-data-extras"/*
#   sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/gimp/2.0"/*/*
  make DESTDIR="$pkgdir/" install
}

