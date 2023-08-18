# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=fbreader-bin
_pkgname=fbreader
pkgver=2.0.3_1
_snap_ver=27
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
sha256sums_x86_64=('067c42e31b3d569674e851d480853dd17c52f83e2c59e238ffd28112b9577ea9')
sha256sums_aarch64=('990779d768d7be3d3e96dfa5930fe105be7ae02d2f3f6cbf69423a82db9dfe63')
options=('!emptydirs')


package() {
  cd "$srcdir"
  cp -rf usr "$pkgdir"
  rm -rf "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/pixmaps/
  mv "$pkgdir"/usr/share/icons/fbreader.png "$pkgdir"/usr/share/pixmaps/
  mv ${pkgdir}/usr/bin/FBReader ${pkgdir}/usr/bin/fbreader
}
