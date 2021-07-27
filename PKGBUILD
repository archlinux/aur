# Maintainer: Rene <rene+_arch@reneschmidt.de>

pkgname=littlenavmap-bin
pkgver=2.6.15
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
_filename=LittleNavmap-linux-20.04-${pkgver}.tar.gz
source=(
  https://github.com/albar965/littlenavmap/releases/download/v${pkgver}/${_filename}
  LittleNavmap.desktop
)
sha512sums=('e8841f69b6e879d429f67b38b7caad5047ede65801c7c04fad720f8f597e20cfdc0f3b3f3e276dd5dbc06f6e97af4846dc673a01794d659d7a45312eaac0f22c'
            'd706e0ee77c714315b3fae1da46633680bf345250fa5561f07c6b1c5445e56897dcae51e5ecf5e493f9e99ae58abe038bf89e4df249323f86e6d7b1ad78befab')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  cp -r "${srcdir}/Little Navmap/." "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/littlenavmap" "${pkgdir}/usr/bin/littlenavmap"
  install -Dm0644 ${srcdir}/${_desktop_name} "${pkgdir}/usr/share/applications/${_desktop_name}"
}
