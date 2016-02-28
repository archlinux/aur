# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow2-bin
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.0.0.128
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('custom:svp-team')
depends=('qt5-base')
makedepends=('chrpath')
source=("http://www.svp-team.com/files/gpl/svpflow-${pkgver}.zip")
sha1sums=('fce68904ebeb5dd553673f2e936b1420e1ab7dd7')

package(){
  cd "svpflow-${pkgver}/lib-linux/vapoursynth"
  [ "${CARCH}" = "i686" ] && install -Dm755 x32/libsvpflow2_vs.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"
  [ "${CARCH}" = "x86_64" ] && install -Dm755 x64/libsvpflow2_vs64.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"

  chrpath -d "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"
}
