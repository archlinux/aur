# Maintainer: Grant G <grant@fig.io>

pkgname='fig-beta'
pkgver='2.13.0_beta.3'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
provides=('fig')
conflicts=('fig')
makedepends=('jq')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/beta/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('677ea3ab7c03a10b2a8e40d09519747a035d31bf4c53c03472f89db5a542d480')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
