# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f29-backgrounds
pkgver=29.0.0
pkgrel=1
_rhver="${pkgver}-3.fc30"
pkgdesc="Fedora 29 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F29_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('6e0f1ec61623941e1685f951af95c7473085a76c8a450d1fb43c1a140a747d68')

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
