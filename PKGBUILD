# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=fhem
pkgver=5.6
pkgrel=1
pkgdesc="A perl server for house automation"
arch=('any')
url="http://fhem.de"
license=('GPL')
depends=('perl')
backup=('opt/fhem/fhem.cfg')
source=(
  "http://fhem.de/${pkgname}-${pkgver}.tar.gz"
  'fhem.service'
)
sha256sums=(
  '19cb2d939bc76524c232ea619b27f25f262109c9b351bd9b83411d6886be4ba9'
  '999335174932e30ac5d4ee80fb74a576ff76dbb52d64704f6f7240c58b19a697'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ROOT="${pkgdir}/" install
  install -Dm 644 "${srcdir}/fhem.service" "${pkgdir}/usr/lib/systemd/system/fhem.service"
}
