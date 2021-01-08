# Maintainer: vit01 (vitirk) <me at ii-net dot tk>
# Contributor: David PS <dps.helio at gmail dot com>

pkgname=jhelioviewer4-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Visualization software for solar image data in space weather context"
arch=('x86_64')
url="http://www.jhelioviewer.org/"
license=('MPL')
depends=('sh')
makedepends=('rpmextract')
source=(
  "${pkgname}.desktop"
  "http://swhv.oma.be/download_test/JHelioviewer_4_0_0_amd64.rpm"
  'https://raw.githubusercontent.com/Helioviewer-Project/JHelioviewer/master/resources/images/hvImage_160x160.png'
)
md5sums=(
         'c7d4c32b587d68c11db5f740550f96f1'
         'efb18b730755b3d8ce7cca8559f11542'
         'f59e81237e7069b0793316d30c7bba8c'
)

package() {
  mkdir -p ${pkgdir}
  cd ${srcdir}
  rpmextract.sh *.rpm

  mv opt ${pkgdir}/

  # install icon
  install -D -m644 $srcdir/hvImage_160x160.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  # install desktop entry
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

