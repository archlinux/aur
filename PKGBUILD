# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=jacktrip
pkgver=1.1
pkgrel=2
pkgdesc="Tool to manage and tune JACK settings for optimum performance between networked machines."
arch=('any')
url="https://github.com/jcacerec/jacktrip"
license=('MIT')
depends=('jack2-dbus' 'qt4')
provides=("jacktrip")
conflicts=("jacktrip")
source=("https://github.com/jcacerec/jacktrip/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4c6b99deb424910348a3a0b8621dba4abfcbdf1a93b3d2a63fe8098113dffc03c472ab536de6c58e9202cd25823af7ebde4ab818e5a74bedcf8b353417dfda91')

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/${pkgname}/src"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}/${pkgname}/src"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  sed -n '1,30p' ../documentation/documentation.cpp > \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
