# Maintainer: Anirudh Konduru <aur@kondu.net>

pkgbase=font-awesome-6
pkgname=(ttf-font-awesome-6 otf-font-awesome-6)
pkgver=6.3.0
pkgrel=1
pkgdesc='Icon fonts from Font Awesome (version 6.x)'
url='https://fontawesome.com/'
license=('custom:OFL')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
# 
sha256sums=('3828163e4da4a513a8a2f21201915fc1e4d45f41ac440844c78a4d6d9ad44f59')

package_ttf-font-awesome-6() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  rename "fa" "fa5" ./webfonts/*.ttf
  install -m644 ./webfonts/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}

package_otf-font-awesome-6() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 ./otfs/*.otf "${pkgdir}/usr/share/fonts/OTF"
}
