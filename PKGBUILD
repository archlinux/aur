# Maintainer: sukanka <su975853527 [AT] gmail.com>
pkgname=fbreader-bin
_pkgname=fbreader
pkgver=2.0.4_1
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
sha256sums_x86_64=('7dc4f8e124949bbe04576d65ef7ed6e83f42c55826d97ea99793d4e38d2c404b')
sha256sums_aarch64=('88d56f078e0dfb089267d4c677d8b163050b5baf9c314ff1aacc79dcf2cb5dd9')
options=('!emptydirs')


package() {
  cd "$srcdir"
  cp -rf usr "$pkgdir"
  rm -rf "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/pixmaps/
  mv "$pkgdir"/usr/share/icons/fbreader.png "$pkgdir"/usr/share/pixmaps/
  mv ${pkgdir}/usr/bin/FBReader ${pkgdir}/usr/bin/fbreader
}
