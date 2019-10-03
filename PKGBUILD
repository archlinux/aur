# Maintainer: Ricardo Madriz <richin13 at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=beefy-miracle-backgrounds
pkgver=16.91.0
pkgrel=15
_rhver="${pkgver}-${pkgrel}.fc31"
pkgdesc="Fedora 17 (Beefy Miracle) backgrounds."
arch=("any")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_17"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/b/${pkgname}-${_rhver}.src.rpm")
sha256sums=('bc0187150cc2bd988ac877cdde127e404f2c6644d3889cc5cc94db04a9935835')

prepare()  {
  tar -xvJf ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}-${pkgver}
  make
}

package() {
  cd ./${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
