pkgname=vapoursynth-plugin-svpflow-bin
pkgver=4.3.0.168
pkgrel=1
pkgdesc="Plugin for Vapoursynth: svpflow1 and svpflow2"
arch=('x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('custom:svp-team')
depends=('gcc-libs')
makedepends=('chrpath')
source=("http://www.svp-team.com/files/gpl/svpflow-${pkgver}.zip")
sha256sums=('fd42a06e3528f278cc846e5027d0e9506bdcb47259afbf99d861e72c2328fd8e')

package() {
  cd "svpflow-${pkgver}"

  install -Dm755 lib-linux/libsvpflow1_vs64.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so"
  install -Dm755 lib-linux/libsvpflow2_vs64.so "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"
  chrpath -d "${pkgdir}/usr/lib/vapoursynth/libsvpflow2.so"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/svpflow/" licenses/*
  install -Dm644 -t "${pkgdir}/usr/share/svpflow/" readme.txt
  install -Dm644 -t "${pkgdir}/usr/share/svpflow/samples/" samples/*.py
}
