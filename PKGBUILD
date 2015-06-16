# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=mercuryex
pkgver=0.0.2
pkgrel=1
pkgdesc="A multi-coin wallet that supports trustless cross-chain trading"
arch=('x86_64')
url="http://mercuryex.com/"
license=('MIT')
source_x86_64=("https://github.com/mappum/mercury/releases/download/0.0.2-alpha/MercuryWallet-0.0.2.jar"
	"mercuryex.sh"
	"LICENSE.md"
  "mercuryex.png"
  "mercuryex.desktop")
md5sums_x86_64=('90924d0f61c66e26c413100b1c18424d'
                '4ce1d64a3c152cc85b99398b1afbe216'
                '6b88abfd948fb39633c620b58c1f90c2'
                '013d2867c255082cef02fae79b875e44'
                '60a827b7da9b0638b9978b9964356611')

package() {
  install -D -m755 "mercuryex.sh" "${pkgdir}/usr/bin/mercuryex"
  install -D -m644 MercuryWallet-${pkgver}.jar "${pkgdir}/usr/share/java/mercuryex/MercuryWallet.jar"

  install -Dm644 mercuryex.desktop "${pkgdir}/usr/share/applications/mercuryex.desktop"
  install -Dm644 mercuryex.png "${pkgdir}/usr/share/pixmaps/mercuryex.png"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
