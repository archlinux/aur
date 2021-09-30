# Maintainer: videah <videah at selfish dot systems>
pkgname=nekojishi
pkgver=1.06
pkgdesc='A free furry/kemono visual novel'
pkgrel=1
arch=('any')
url='https://nekojishi.tw/en-index.html'
license=('custom:freeware')
depends=('sh')
install=${pkgname}.install
options=(!strip)

# personal mirror for nekojishi, as it's impossible to use GDrive links in PKGBUILD's
downloadmirror='https://uwueviee.live/Nekojishi-pc(1.06).zip'

source=("Nekojishi_Standard${pkgver}-linux.tar.bz2::${downloadmirror}"
	"${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.png")

md5sums=('b125910425eca690200b95339eb7af3c'
	 '049aca1f2158f12f3923e0da7a32bb60'
	 '852ba4bfcaff46021157f49529099720'
	 '9c553c00bdb9f1e97504b9f53fe678db')

package() {

  # install game files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r Nekojishi-pc/. "${pkgdir}/usr/share/${pkgname}"
  install -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/${pkgname}/icon.png"

  # copy sh
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # setup .desktop
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
