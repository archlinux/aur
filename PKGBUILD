# Maintainer: Bikash Thapa Magar <thpsbikash@gmail.com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=jhelioviewer
pkgver=4.5.5
pkgrel=1
pkgdesc="Visualization software for solar image data"
arch=('x86_64')
url="https://www.jhelioviewer.org/"
license=('MPL')
depends=('java-runtime')
makedepends=()
noextract=()
source=("$pkgname"
  "${pkgname}.desktop"
  'http://swhv.oma.be/download/JHelioviewer_4_5_5_x86_64.rpm'
)
md5sums=('173482ed34e21169a138e92de47656c6'
         '4cdedcd67c7371762d4ad17b7ce91a32'
         'd374a6c3cbf1a77b6caa3866f525a175')

package() {
  # install files
  cp -r $srcdir/opt $pkgdir

  # install icon
  install -D -m644 $srcdir/opt/JHelioviewer/.install4j/${pkgname}.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  # install /usr/bin binary
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install desktop entry
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

