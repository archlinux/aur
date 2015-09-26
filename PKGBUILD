# Maintainer: agnotek <agnostic.sn [at] gmail [dot] com>

pkgname=uudownloader
pkgver=1.6
pkgrel=1
pkgdesc="Downloader for uupgrades - only gets the program"
arch=('any')
url="http://manjaro.org"
license=('GPL3')
makedepends=('zip')
depends=('yad' 'gksu')
options=('!strip')
md5sums=('c6d4a4b95971e2dcb6ae6acbb2aaadd1'
	 '5ffbc62685af0fd585ce85d5dea11014')

source=("https://dl.dropboxusercontent.com/u/9839330/uupgrades/AUR-Files/uudownloader-$pkgver.tar.gz"
	"uudowner.desktop")

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  echo "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 ${srcdir}/uudownloader "${pkgdir}/usr/share/${pkgname}/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/uudownloader" "${pkgdir}/usr/bin/uudownloader"

  # Desktop file
  install -Dm644 "${srcdir}/uudowner.desktop" "${pkgdir}/usr/share/applications/uudowner.desktop"
}

