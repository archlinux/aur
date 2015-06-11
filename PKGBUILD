# Maintainer: Michael Bryant (Shadow53)
pkgname=asciitube
pkgdesc="Collection of scripts to watch youtube videos in a terminal or tty"
url="https://www.github.com/Shadow53/asciitube"
pkgrel="1"
arch=('any')
depends=('aalib' 'libcaca' 'mplayer' 'nodejs' 'youtube-dl')
license=('GPLv3')
source=("git+https://www.github.com/Shadow53/asciitube.git")
md5sums=('SKIP')
pkgver="$(date +%Y%m%d%H%M%S)"

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/opt/${pkgname}/scripts"
  mkdir -p "${pkgdir}/usr/bin/"
  install -m775 asciitube.sh "${pkgdir}/opt/${pkgname}"
  install -m775 scripts/* "${pkgdir}/opt/${pkgname}/scripts/"
  ln -s /opt/${pkgname}/asciitube.sh ${pkgdir}/usr/bin/asciitube
}