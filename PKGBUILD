# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow2-bin
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.3.0.168
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('custom:svp-team')
depends=('gcc-libs')
makedepends=('chrpath')
source=("http://www.svp-team.com/files/gpl/svpflow-${pkgver}.zip")
sha256sums=('fd42a06e3528f278cc846e5027d0e9506bdcb47259afbf99d861e72c2328fd8e')

package() {
  cd "svpflow-${pkgver}"
  install -Dm755 lib-linux/libsvpflow2_vs64.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"

  chrpath -d "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"

  install -Dm644 licenses/svp_libraries.txt "${pkgdir}/usr/share/licenses/${pkgname}/spv_libraries.txt"
}
