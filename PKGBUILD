
# Maintainer: Rahul G <rahulg.astro@gmail.com>
# Maintainer: Bikash Thapa Magar <thpsbikash@gmail.com>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=jhelioviewer
pkgver=4.8.0
pkgrel=1
pkgdesc="Visualization software for solar image data"
arch=('x86_64')
url="https://www.jhelioviewer.org/"
license=('MPL')
depends=('java-runtime')
makedepends=()
noextract=()
source=("${pkgname}"
  "${pkgname}.desktop"
  'http://swhv.oma.be/download/JHelioviewer_4_8_0_x86_64.rpm'
)

md5sums=(
	'843337bcd3c49e7f24c98383640c7070'
	'4cdedcd67c7371762d4ad17b7ce91a32'
	'b5518f474e638118a46c7070aa3caced'
         )

package() {
  # install files
  cp -r $srcdir/opt $pkgdir

  # install icon
  install -D -m644 $srcdir/opt/JHelioviewer/.install4j/JHelioviewer.png $pkgdir/usr/share/pixmaps/${pkgname}.png

  # install /usr/bin binary
  install -D -m755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname

  # install desktop entry
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
