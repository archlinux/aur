# Maintainer: videah <videah at selfish dot systems>
pkgname=nekojishi
pkgver=1.01
pkgdesc='A free furry/kemono visual novel'
pkgrel=3
arch=('any')
url='https://nekojishi.tw/en-index.html'
license=('custom:freeware')
depends=('sh')
install=${pkgname}.install
options=(!strip)

# personal mirror for nekojishi, as it's impossible to use GDrive links in PKGBUILD's
downloadmirror='https://cloud.videah.xyz/s/3wZSyDDeB4ywNt2/download'

source=("Nekojishi_Standard${pkgver}-pc.zip::${downloadmirror}"
	"${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.png")

md5sums=('107768d7cc8a55c36c2b6635a03fb89c'
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
