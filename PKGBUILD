# Maintainer: Rene <rene+_arch@reneschmidt.de>

pkgname=littlenavmap-bin
pkgver=2.8.7
pkgrel=1
pkgdesc="A Free Open Source Flight Planner, Navigation Tool, Moving Map, Airport Search, and Airport Information System for Flight Simulator X, Prepar3D, Microsoft Flight Simulator 2020, and X-Plane"
license=('GPL3')
provides=('littlenavmap-bin')
conflicts=('littlenavmap-bin')
arch=('x86_64')
url="https://albar965.github.io/littlenavmap.html"
depends=('glibc' 'gcc-libs' 'glib2' 'pcre' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libglvnd' 'gtk3' 'qt5-declarative' 'qt5-svg')
options=(!strip)
_desktop_name=LittleNavmap.desktop
_filename=LittleNavmap-linux-22.04-${pkgver}.tar.gz
source=(
  https://github.com/albar965/littlenavmap/releases/download/v${pkgver}/${_filename}
  LittleNavmap.desktop
)
package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  cp -r "${srcdir}/LittleNavmap-linux-22.04-${pkgver}/." "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/littlenavmap" "${pkgdir}/usr/bin/littlenavmap"
  install -Dm0644 ${srcdir}/${_desktop_name} "${pkgdir}/usr/share/applications/${_desktop_name}"
}
sha256sums=('94ab98842b56d97db2355fc791451105845d96c3736ab83eb1130c96304864ee'
            '819d910da45eaba4531c66f28e42ee68d67592f3870e1a925140e151c8891272')
