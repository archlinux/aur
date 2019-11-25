# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=turbowin-plus
pkgver=3.3.0
pkgrel=1
epoch=
pkgdesc="Assists an observer in reporting and transmitting marine weather observations."
arch=("x86_64" "aarch64")
url="http://projects.knmi.nl/turbowin/"
license=('GPL')
depends=('java-runtime')
provides=('turbowin-plus')
options=('!strip')
install="turbowin-plus.install"
source=("http://projects.knmi.nl/turbowin/download/TurboWin+.zip" "turbowin-plus.desktop" "turbowin-plus" "turbowin-plus.install")
sha1sums=('a586a92cd29d9c6e12472d8e5321471a79cac7c9'
          'b21f071cb4c9057979e6f780b7bed588b6c99693'
          '4e52a79032a1fa9efc80af9af746f24d885684b6'
          '1128f83382617d12a4db3fdd75729753a6c5e5a1')

build() {
    cd $srcdir
}

package() {
    cd $pkgdir
    mkdir -p usr/share/pixmaps
    mkdir -p usr/share/applications
    mkdir -p usr/share/turbowin-plus
    mkdir -p usr/bin/
    mv $srcdir/TurboWin+/TurboWin+_install.ico usr/share/pixmaps/turbowin-plus.ico
    mv $srcdir/turbowin-plus usr/bin/
    mv $srcdir/turbowin-plus.desktop usr/share/applications/
    chmod +x usr/bin/turbowin-plus
    cp -r $srcdir/TurboWin+/* usr/share/turbowin-plus/
}
