# Maintainer: Kewl <lfxm@bmup.fv.psh (rot1)>
# Contributor: Bjoern Franke <bjo@nord-west.org>
_watch=('https://www.xnview.com/en/xnconvert/' '>Version (\d[\d.]*\d+)\b')

pkgname=xnconvert
pkgver=1.82
pkgrel=1
pkgdesc="A powerful batch image-converter and resizer."
url="https://www.xnview.com/en/xnconvert/"
arch=('x86_64' 'i686')
license=('custom')
depends=('qt5-svg' 'qt5-sensors' 'libwebp' 'gtk3')
source=("${pkgname}.desktop")
source_x86_64=("XnConvert-linux-x64_${pkgver}.tgz::http://download.xnview.com/XnConvert-linux-x64.tgz")
source_i686=("XnConvert-linux_${pkgver}.tgz::http://download.xnview.com/XnConvert-linux.tgz")
md5sums=('3f33af83785546964d6e28ad1e06b642')
md5sums_x86_64=('a7e5dbe37bebd0b516bd159ad00966a2')
md5sums_i686=('bd7e065c5588d2e878b8605acddaf683')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -dr XnConvert/* "${pkgdir}/opt/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/xnconvert.sh "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 XnConvert/license.txt "${pkgdir}/usr/share/licenses/$pkgname/license.txt"

  rm "${pkgdir}/opt/${pkgname}/XnConvert.desktop"
}
