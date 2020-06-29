# Maintainer: Nicolas Goy <kuon@goyman.com>

pkgname=front-panel-designer-eu
pkgver=6.3.0
pkgrel=1
epoch=
pkgdesc="Free CAD software for front panel design"
arch=("any")
url="http://www.schaeffer-ag.de/en/"
license=('custom')
groups=()
depends=(libpng12)
options=(!strip)
source_x86_64=(
"https://assets.schaeffer-ag.de/fpd/Version-$pkgver/FrontDesign-EU-$pkgver-amd64.AppImage"
"front-panel-express-eu.desktop")
md5sums_x86_64=("2e65d9d46a67eebbd9f0a7693ad0b276" "d34b7ed5d87a206fe8b50fd4a8f8e167")
noextract=("FrontDesign-EU-$pkgver-amd64.AppImage")

package() {
  install -Dm 755 \
       "$srcdir/FrontDesign-EU-$pkgver-amd64.AppImage" \
       "$pkgdir/opt/FrontDesignEU/FrontDesignEU.AppImage"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/FrontDesignEU/FrontDesignEU.AppImage" "$pkgdir/usr/bin/FrontDesignEU"

  install -Dm 644 \
      "$srcdir/front-panel-express-eu.desktop" \
      "$pkgdir/usr/share/applications/front-panel-express-eu.desktop"
}
