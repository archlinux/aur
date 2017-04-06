# Maintainer: Rob McFadzean <root@sphericalcube.net>
# Contributor: Jordan J Klassen <forivall@gmail.com>
# Upstream URL: https://github.com/Shopify/themekit

pkgname=shopify-themekit-bin
pkgver=0.6.11
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('i686' 'x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
depends=()
conflicts=('shopify-themekit')

source_i686=("shopify-themekit-v${pkgver}-i686.zip::https://github.com/Shopify/themekit/releases/download/v${pkgver}/linux-386.zip")
source_x86_64=("shopify-themekit-v${pkgver}-x86_64.zip::https://github.com/Shopify/themekit/releases/download/v${pkgver}/linux-amd64.zip")
sha256sums_i686=('6da2f2f33acd0b7ac6de2ed107f2bf8d82757eb28e61ccb9fe188525cf019e13')
sha256sums_x86_64=('49f9fc2e7a386d1cd46f77263adb1ab4553ce419b16b52381274ed59074d68b0')

package() {
  local subdir
  if [ "$CARCH" = "i686" ]; then
    subdir="linux-386"
  else
    subdir="linux-amd64"
  fi
  install -Dm0755 "${srcdir}/${subdir}/theme" "${pkgdir}/usr/bin/theme"
}
