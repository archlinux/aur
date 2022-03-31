# Maintainer: arcamagna <dev@arcamagna.com>
pkgname=videowall-git
_pkgname=videowall
pkgver=0.1
pkgrel=1
pkgdesc="Mimics a video wall by creating an overlay filter for ffmpeg"
arch=('any')
url='https://github.com/arcamagna/videowall'
license=('GPL3')
depends=('bash' 'xorg-xdpyinfo' 'ffmpeg' 'ffprobe' 'pciutils')
optdepends=('mpv')
makedepends=('git')
provides=(_pkgname)
conflicts=(_pkgname)
source=('git+https://github.com/arcamagna/videowall.git')
md5sums=('SKIP')
pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}
package() {
  cd "${_pkgname}"
  install -Dm755 videowall "${pkgdir}/usr/bin/videowall"  
}

