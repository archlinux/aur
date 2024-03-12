# Maintainer: Grant G <grant@fig.io>

pkgname='fig-headless-bin'
pkgver='2.18.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
provides=('fig')
conflicts=('fig')
makedepends=('jq' 'xz')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig_headless.tar.xz")

sha256sums=('e6d4d867c3e5e2f0ff4451d07c4e0fb0687e09256178819d0198a3c9838a5489')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
