# Maintainer: agnotek <agnostic [dot] sn [at] gmail [dot] com>

pkgname=fm4trackservice
pkgver=0.2
pkgrel=1
pkgdesc="FM4 Trackservice for Systray"
arch=('any')
url="http://fm4.orf.at/"
license=('GPL3')
makedepends=('zip')
depends=('yad')
options=('!strip')
install="fm4tracks.install"
md5sums=('7070ae3f40e3d15a590d6bec9589b821'
         '38cbe2ef7de194e44e82658007451d19'
         '1b0ce875d878a055499ee0f06ad8cd08'
	 '2c7bd24fcdf546641c14df2686f19dbb')

source=("https://dl.dropboxusercontent.com/u/9839330/fm4track/fm4trackservice-${pkgver}.tar.gz"
        "fm4tracks.install"
        "fm4tracks.desktop"
	"fm4tracks.png")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  echo "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 ${srcdir}/fm4trackservice "${pkgdir}/usr/share/${pkgname}/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/fm4trackservice" "${pkgdir}/usr/bin/fm4trackservice"

  # Desktop file
  install -Dm644 "${srcdir}/fm4tracks.desktop" "${pkgdir}/usr/share/applications/fm4tracks.desktop"

  # Icon file
  install -Dm644 "${srcdir}/fm4tracks.png" "${pkgdir}/usr/share/icons/fm4tracks.png"

}
