# Maintainer: zoe <chp321@gmail.com>

pkgname=bikexperience
pkgver=5.7.0
pkgrel=1
pkgdesc="Software for outdoor training planning and gpx-track-management"
arch=('any')
url="http://www.bikexperience.de/"
license=('GPL')
depends=('java-runtime' 'unzip')
optdepends=('rxtx: for serial connection with bike computers')
source=(
"http://www.bikexperience.de/download/bXp-${pkgver}-common-install.zip"
"bikeXperience.desktop"
"bxpicon.png"
"bikeXperience")

md5sums=(
'22f3d5a0eb8ebe326a62413bae223c6e'
'28d05ae6d71f8cfb18e9cf8469281355'
'51830fb6b0fb7d5cd2e74ef7f697d222'
'70b9104796d1a645509395da4822b96b')
                
package() {
 mkdir -p $pkgdir/opt/${pkgname} $pkgdir/usr/share/applications $pkgdir/usr/share/icons/hicolor/100x100/apps/ $pkgdir/usr/bin/
 install -D -m 755 $srcdir/bikeXperience.jar $pkgdir/opt/${pkgname}/
 install -D -m 644 $startdir/bikeXperience.desktop $pkgdir/usr/share/applications/
 install -D -m 644 $startdir/bxpicon.png $pkgdir/usr/share/icons/hicolor/100x100/apps/
 install -D -m 755 $startdir/bikeXperience $pkgdir/usr/bin/
}
