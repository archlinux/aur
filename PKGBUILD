# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=jhelioviewer
pkgver=2.3.3
pkgrel=1
pkgdesc="Visualization software for solar image data"
arch=('x86_64')
url="http://www.jhelioviewer.org/"
license=('MPL')
depends=('java-runtime=8')
makedepends=()
noextract=()
source=("$pkgname"
  "${pkgname}.desktop"
  'https://github.com/Helioviewer-Project/JHelioviewer/releases/download/2.3.3/JHelioviewer_2_3_3_64_bit.rpm'
)
md5sums=('173482ed34e21169a138e92de47656c6'
         '4cdedcd67c7371762d4ad17b7ce91a32'
         'bf2bb6ed3a7f8b6c4f0297e347b3abdc')

package() {
  # install files
  cp -r $srcdir/opt $pkgdir

  # install icon
  install -D -m644 $srcdir/opt/JHelioviewer/resources/images/hvImage_160x160.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  # install /usr/bin binary
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install desktop entry
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
