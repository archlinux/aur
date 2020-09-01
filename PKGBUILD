# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname='papirus-folders'
pkgver=1.8.0
pkgrel=3
pkgdesc='Change Papirus icon theme folder colors'
arch=('x86_64')
url='https://github.com/PapirusDevelopmentTeam/papirus-folders'
license=('MIT')
depends=('papirus-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.hook")
sha256sums=('a60d0d432ea9b7c98b74a607301bdc4e26b3b48a3b9bc6054ffb7d64f8dcf9c5'
            '5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
  install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks" "${pkgname}.hook"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
