# Maintainer: Nicolas Goy <kuon@goyman.com>

pkgname=front-panel-designer-eu
pkgver=6.2.1
pkgrel=1
epoch=
pkgdesc="Free CAD software for front panel design"
arch=("any")
url="http://www.schaeffer-ag.de/en/"
license=('custom')
groups=()
depends=(libpng12)
source=(
"https://assets.schaeffer-ag.de/fpd/Version-$pkgver/FrontDesign-EU-$pkgver-amd64.tgz"
"front-panel-express-eu.desktop" "front-panel-express-order-eu.desktop")
md5sums=("1a7f5858141c90e02b07298bc7617ff3" "d34b7ed5d87a206fe8b50fd4a8f8e167"
"8bb49915edf0a5c611494b7753f9103f")

package() {
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/FrontDesign" "$pkgdir/opt/FrontDesignEU"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/FrontDesignEU/bin/FrontDesign "$pkgdir/usr/bin/FrontDesignEU"
  ln -s /opt/FrontDesignEU/bin/FrontDesign-Order "$pkgdir/usr/bin/FrontDesignEU-Order"

  install -Dm 644 \
      "$srcdir/front-panel-express-eu.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express-eu.desktop"
  install -Dm 644 \
      "$srcdir/front-panel-express-order-eu.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express-order-eu.desktop"

  install -Dm 644 \
      "$srcdir/FrontDesign/share/FrontDesign/License/License_EN.html" \
      "$pkgdir/usr/share/licenses/$pkgname/License.html"
  install -Dm 644 \
      "$srcdir/FrontDesign/share/FrontDesign/License/ThirdPartyLicenses.html" \
      "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyLicenses.html"
}
