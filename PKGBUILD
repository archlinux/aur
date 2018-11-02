# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=f29-backgrounds
pkgver=29.1.2
pkgrel=2
_rhver="${pkgver}-1.fc29"
pkgdesc="Fedora 29 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F29_Artwork"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/29/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('37cb8e8e1e67552d5fea7181d5a67c09d25b1e1f2ec765aaf3f2e016041d88aa')

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
