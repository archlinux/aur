# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=papirus-folders
pkgver=1.7.0
pkgrel=3
pkgdesc='Change Papirus icon theme folder colors'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/papirus-folders'
license=('MIT')
depends=('papirus-icon-theme')
source=("${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.hook")
sha256sums=('8ba3ebd98b077ea45133bbccbf5751160f47303f951fce7d48e2772a1469ba82'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: