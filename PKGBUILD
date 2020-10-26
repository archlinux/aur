# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=linuxcnc-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Controls CNC machines. It can drive milling machines, lathes, 3d printers, laser cutters, plasma cutters, robot arms, hexapods, and more (formerly EMC2)"
arch=('x86_64')
license=('GPL2')
url="http://linuxcnc.org"
depends=('bc'
         'bwidget'
         'libxaw'
         'python2-imaging'
         'python2-yapps2'
         'tkimg'
         'python2-gtkglext'
         'tclx'
         'xorg-server'
         'boost'
         'procps-ng'
         'psmisc')
provides=('linuxcnc')
conflicts=('linuxcnc' 'linuxcnc-git')
source=("${pkgname}-${pkgver}.deb::http://linuxcnc.org/dists/stretch/2.8-rtpreempt/binary-amd64/linuxcnc-uspace_${pkgver}_amd64.deb")
sha256sums=('86fc5708552300316add400c83afe56537c15ae9ab5d9c597c87f4c9b0d2316b')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}/lib/udev" "${pkgdir}/usr/lib/"
  rm -rf "${pkgdir}/lib"
}
