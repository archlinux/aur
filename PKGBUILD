# Maintainer: Grant G <grant@fig.io>

pkgname='fig'
pkgver='2.13.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'ibus' 'xdg-utils')
makedepends=('jq')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig.tar.xz")

sha256sums=('48794cfb479aca36f6e4b0f30af2f73f5623b1b994a7131441bda1efdef8b044')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
