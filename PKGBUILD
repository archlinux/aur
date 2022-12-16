# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: BadAtNames <badatnames@tutanota.com>

pkgname=ttf-mutant-emoji
pkgver=2020.04 # Could use pkgver for this if mutant stopped changing how they package the fonts every month :(
pkgrel=1
pkgdesc="A new kind of emoji set - more flexible, inclusive and fun!"
arch=('any')
url="https://mutant.tech"
license=('custom:CC BY-NC-SA 4.0')
provides=('emoji-font')
depends=('fontconfig')
install="${pkgname}.install"
source=(
  "${url}/dl/${pkgver}/mtnt_${pkgver}_font_sbixot.zip"
  '75-mutant-standard-emoji.conf'
)

package() {
  install -Dm644 -t "${pkgdir}/etc/fonts/conf.avail" 75-mutant-standard-emoji.conf

  cd "mtnt_${pkgver}_font_sbixot"
  
  install -Dm644  "font/MutantStandardEmoji-sbixOT.ttf" "${pkgdir}/usr/share/fonts/TTF/Mutant.ttf"
  install -Dm644 "license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('1da654a4f50bfb4bdb461d8b4283e1cc'
         '609aaef8b63b3193bc02440307a0a4f3')
