# Maintainer: Kewl <lfxm@bmup.fv.psh (rot1)>
# Contributor: Bjoern Franke <bjo@nord-west.org>
_watch=('https://www.xnview.com/en/xnconvert/' '>Version (\d[\d.]*\d+)\b')

pkgname=xnconvert
pkgver=1.83
pkgrel=1
pkgdesc="A powerful batch image-converter and resizer."
url="https://www.xnview.com/en/xnconvert/"
arch=('x86_64' 'i686')
license=('custom')
depends=('qt5-svg' 'qt5-sensors' 'libwebp' 'gtk3')
source=("${pkgname}.desktop")
source_x86_64=("XnConvert-linux-x64_${pkgver}.tgz::http://download.xnview.com/XnConvert-linux-x64.tgz")
source_i686=("XnConvert-linux_${pkgver}.tgz::http://download.xnview.com/XnConvert-linux.tgz")
sha256sums=('b163bca7039f6877239535b88b9aacb6fde78573dc141a52addb99cb85b35f82')
sha256sums_x86_64=('1b15798f0855d913673da65effc9a38c08a8bab8f9b7b297ea5306da809b7d81')
sha256sums_i686=('6e3a021d7636f747d15b1556051855c78c1916e05cb057b919d8a66d6271680a')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -dr XnConvert/* "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/xnconvert.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 XnConvert/license.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"

  rm "${pkgdir}/opt/${pkgname}/XnConvert.desktop"
}
