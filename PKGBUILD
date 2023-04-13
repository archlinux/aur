# Maintainer: Nicola Revelant <nicolarevelant44@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=papirus-filezilla-themes
pkgver=20200105
pkgrel=2
pkgdesc='Papirus icon theme for Filezilla'
arch=('any')
url='https://github.com/PapirusDevelopmentTeam/papirus-filezilla-themes'
license=('GPL3')
depends=('filezilla')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('28e28c50b6b500b522f78590ce442e2ed93c5c2bd7a169ee1d31ab588af92427')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}-${pkgver}" install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
