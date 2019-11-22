# $Id$
# Maintainer: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f30-backgrounds
pkgver=30.1.2
pkgrel=2
_rhver="${pkgver}-2.fc31"
pkgdesc="Fedora 30 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Artwork/MediaArt/F30"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('dcc0cae7a7d689498ec88f162a2b514918ed894e73011149a701846ef5abbd26')

prepare()  {
  tar -xvJf ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}
  make
}

package() {    
  cd ./${pkgname}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
