# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.11.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
makedepends=('jq')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('0615e8dc3871bec3be8f338af0cb8996d77c3de5864f4285d62869c5d5436e64')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
