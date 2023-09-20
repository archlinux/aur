# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=fbreader-bin
_pkgname=fbreader
pkgver=2.0.5_1
pkgrel=1
pkgdesc="An e-book reader for Linux"
arch=('x86_64' 'aarch64')
url="https://www.fbreader.org/"
license=('unknown')
depends=('qt6-5compat' 'libzip' 'icu72')
provides=('fbreader')
conflicts=('fbreader')
source_x86_64=("https://fbreader.org/static/packages/linux/rpms/fbreader-${pkgver/_/-}.x86_64.rpm")
source_aarch64=("https://fbreader.org/static/packages/linux/rpms/fbreader-${pkgver/_/-}.aarch64.rpm")

# download url
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/fbreader | jq '.download_url' -r
sha256sums_x86_64=('e31ab0544fcdb4455665b9368fb0baf6252fcc933df029c6836d7088b6e51cc2')
sha256sums_aarch64=('6b0a8369cb9670136fb91cedcf2d9a2cf4c899b5a59068c5772740ab4a0044ac')
options=('!emptydirs')


package() {
  cd "$srcdir"
  cp -rf usr "$pkgdir"
  rm -rf "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/pixmaps/
  mv "$pkgdir"/usr/share/icons/fbreader.png "$pkgdir"/usr/share/pixmaps/
  mv ${pkgdir}/usr/bin/FBReader ${pkgdir}/usr/bin/fbreader
}
