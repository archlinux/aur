# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow2-bin
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.2.0.142
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('custom:svp-team')
depends=('qt5-base')
makedepends=('chrpath')
source=("http://www.svp-team.com/files/gpl/svpflow-${pkgver}.zip")
sha256sums=('02e89dc04b0c29e15a9db7cd23801477a2f672d317a13cb7f2f8577192694c63')

package(){
  cd "svpflow-${pkgver}/lib-linux"
  install -Dm755 libsvpflow2_vs64.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"

  chrpath -d "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"
}
