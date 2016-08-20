# Maintainer: Jordan J Klassen <forivall@gmail.com>
# Upstream URL: https://github.com/atom/atom

pkgname=shopify-themekit-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A cross-platform tool for building Shopify Themes"
arch=('i686' 'x86_64')

url="https://github.com/Shopify/themekit"
license=('MIT')
depends=()
conflicts=('shopify-themekit')

source_i686=("shopify-themekit-v${pkgver}-i686.zip::https://github.com/Shopify/themekit/releases/download/${pkgver}/linux-386.zip")
source_x86_64=("shopify-themekit-v${pkgver}-x86_64.zip::https://github.com/Shopify/themekit/releases/download/${pkgver}/linux-amd64.zip")
md5sums_i686=('270820b9377f7515e69f83b7920b8ec7')
md5sums_x86_64=('9ba2f7541afe45bf4ca6ce47d744ee4f')

package() {
  local subdir
  if [ "$CARCH" = "i686" ]; then
    subdir="linux-386"
  else
    subdir="linux-amd64"
  fi
  install -Dm0755 "${srcdir}/${subdir}/theme" "${pkgdir}/usr/bin/theme"
}
