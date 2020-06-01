# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=papirus-folders
pkgver=1.7.0
pkgrel=1
pkgdesc="Change Papirus icon theme folder colors"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
license=('MIT')
source=("https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.hook")
depends=('papirus-icon-theme')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
sha256sums=('8ba3ebd98b077ea45133bbccbf5751160f47303f951fce7d48e2772a1469ba82'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9')

package() {
  install -Dm644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
