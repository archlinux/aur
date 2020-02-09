# Maintainer: Piotr Rogoza <piotr.r.public@gmail.com>
# Contributor: Jorge <jorge.barroso.11@gmail.com>

pkgname=gimp-extras
pkgver=2.0.2
pkgrel=1
_pkgrel=1
pkgdesc="The extra brushes and patterns from ubuntu"
arch=('any')
url="http://packages.ubuntu.com/search?searchon=names&keywords=gimp-data-extras"
license=('GPL2')
depends=('gimp')
source=(http://de.archive.ubuntu.com/ubuntu/pool/universe/g/gimp-data-extras/gimp-data-extras_${pkgver}-${_pkgrel}_all.deb)
sha512sums=('7bd151b2744982d92458e1cacc9ae841bf26a8cb2b5f6c2b83258673da60c4d7ec3f6bdd37f85c2ee4a76948d7a390cf845d9919a7f179c9d63bf9f6ca10f3ee')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz
  install -m755 -d "${pkgdir}/usr/"
  cp -r "${srcdir}/usr/" "${pkgdir}"

  sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/doc/gimp-data-extras"/*
  sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/gimp/2.0"/*/*
}

