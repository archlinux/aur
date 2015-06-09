# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
pkgname=gog-quest-for-infamy
_original="Quest For Infamy"
pkgver=1.1.0.4
pkgrel=3
pkgdesc="Quest For Infamy is a role-playing adventure game where you assume the identity of Mr. Roehm - a scoundrel who is on the run from his latest scrape. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/quest_for_infamy"
license=('custom')
groups=('games')
source=("local://gog_quest_for_infamy_${pkgver}.tar.gz"
        "${pkgname}")
PKGEXT=".pkg.tar"
sha256sums=('2e1e05313e3c0db48831e284075019c18d9245f968ca1177ce82b6375e85bf00'
            '8e226ffb62292c57e4bc76eb0e565f272e6d9d2283541cef7648e3abbcf829de')

package() {
  mkdir -p "${pkgdir}"/opt/gog/${pkgname}
  cp -r "${srcdir}"/"${_original}"/* "${pkgdir}"/opt/gog/${pkgname}
  chown -R :games "${pkgdir}"/opt/gog/${pkgname}
  chmod 775 "${pkgdir}"/opt/gog/${pkgname}/game
  chmod 644 "${pkgdir}"/opt/gog/${pkgname}/game/acsetup.cfg
  chmod 644 "${pkgdir}"/opt/gog/${pkgname}/game/agsgame.dat
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}-primary.desktop "${pkgdir}"/usr/share/applications/${pkgname}-primary.desktop
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 "${srcdir}"/"${_original}"/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/${pkgname}
}
