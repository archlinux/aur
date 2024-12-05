pkgname=scenic-view
pkgver=11.0.2
pkgrel=2
pkgdesc='A tool for analyzing the scenegraph of a JavaFX application'
arch=('i686' 'x86_64')
url='https://github.com/JonathanGiles/scenic-view'
license=(GPL)
depends=('java21-openjfx')
source=('https://download.jonathangiles.net/downloads/scenic-view/scenicview-21-linux.zip'
        'scenic-view'
        'scenic-view.desktop')
sha256sums=('368ce807b4dda6d7422dbfb7bd977d4d18dded6a3a36b27e10912ce5536656d5'
            '69084d16a2aeb71dc08db67ccfc8d467d0508e7f76a2ba0043312ad534f0cd30'
            '7d1fb4e5a06a081b604e10acef772e809b0aa6a7c56edbfba8bce8af47cabd96')

prepare() {
  unzip -o scenicview-linux.zip
}

package() {
  install -Dm644 "$srcdir/scenicview/lib/scenicview.jar" "$pkgdir/usr/share/java/scenic-view/scenicview.jar"

  install -Dm755 scenic-view "$pkgdir/usr/bin/scenic-view"
  install -Dm644 scenic-view.desktop "$pkgdir/usr/share/applications/scenic-view.desktop"

  #install -Dm644 org/scenicview/view/images/ui/mglass.png "$pkgdir/usr/share/pixmaps/scenic-view.png"
}
