# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-blackwell-deception
pkgver=1.0.0.2
pkgrel=1
pkgdesc="Meet Rosangela Blackwell, an embittered writer who just found out that she is a medium and that it’s her mission."
arch=("i686" "x86_64")
url="http://www.gog.com/game/blackwell_bundle"
license=("custom")
groups=("games")
source=("local://gog_blackwell_deception_${pkgver}.tar.gz" "gog-blackwell-deception")
sha256sums=('bc317479fc432a9f873c5c24c6000a91edbb618dbecc7dc20d7d292d9048df02'
            '96d1bb5c6648748be966ace6bb9c3d380f207d577c7dc729e8778ea409cbe442')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/blackwell-deception
  cp -r "${srcdir}"/Blackwell\ Deception/* "${pkgdir}"/opt/gog/blackwell-deception
  install -Dm644 "${srcdir}"/Blackwell\ Deception/support/gog-blackwell-deception-primary.desktop "${pkgdir}"/usr/share/applications/gog-blackwell-deception.desktop
  install -Dm644 "${srcdir}"/Blackwell\ Deception/support/gog-blackwell-deception.png "${pkgdir}"/usr/share/pixmaps/gog-blackwell-deception.png
  install -Dm644 "${srcdir}"/Blackwell\ Deception/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-blackwell-deception" "${pkgdir}/usr/bin/gog-blackwell-deception"
}
