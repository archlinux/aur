# Maintainer: videah <videah at selfish dot systems>
pkgname=nekojishi
pkgver=1.01
pkgdesc='A free furry/kemono visual novel'
pkgrel=2
arch=('any')
url='https://nekojishi.tw/en-index.html'
license=('custom:freeware')
depends=('sh')
install=${pkgname}.install
options=(!strip)

# nekojishi is now hosted on google drive which is a little messy for direct links
# this is just to make the PKGBUILD a little cleaner.
IFS=''
gdrive=('https://doc-0s-7c-docs.googleusercontent.com'
	'/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/ut3ponk4lq5b7tgg46g71mc50no6esid'
	'/1511416800000/03311035500713382627/*/1DKqNwQg4gwZmCvMAEiCF0EzYVjZVQvt4?e=download')

source=("Nekojishi_Standard${pkgver}-pc.zip::${gdrive[*]}"
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
