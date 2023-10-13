# Maintainer: Grant G <grant@fig.io>

pkgname='fig-headless-bin'
pkgver='2.17.0'
pkgrel=1
pkgdesc='Adds IDE-style autocomplete to your existing terminal.'
arch=('x86_64')
url='https://fig.io'
license=('custom')
provides=('fig')
conflicts=('fig')
makedepends=('jq' 'xz')
source=("${pkgname}-${pkgver//_/-}.tar.xz::https://repo.fig.io/generic/stable/asset/${pkgver//_/-}/x86_64/fig_headless.tar.xz")

sha256sums=('399abbc2c4d2c72ba0af466d5931690bbad591627d906811d691add185e3fcb2')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
  manifest="${pkgdir}/usr/share/fig/manifest.json"
  echo "$( jq '.managed_by = "pacman"' $manifest )" > $manifest
}
