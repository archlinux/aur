pkgname=scenic-view
pkgver=8.7.0
pkgrel=1
pkgdesc='A tool for analyzing the scenegraph of a JavaFX application'
arch=('i686' 'x86_64')
url='http://fxexperience.com/scenic-view/'
license=('GPL')
depends=('java-runtime')
source=("http://fxexperience.com/downloads/scenic-view-${pkgver}"
        'scenic-view'
        'scenic-view.desktop')
sha256sums=('12f4a908dd39ab1cfe2f57cbc7a3802b65267c3b33cac34e554ffce69179be74'
            'e7523143f53fd2b4fb18a7cfb8acb9f2af02270cf3e751063b99268d10a5d48e'
            '7d1fb4e5a06a081b604e10acef772e809b0aa6a7c56edbfba8bce8af47cabd96')

prepare() {
  jar xf scenicView.jar
}

package() {
  install -Dm644 scenicView.jar "$pkgdir/usr/share/java/scenic-view/scenicView.jar"

  install -Dm755 scenic-view "$pkgdir/usr/bin/scenic-view"
  install -Dm644 scenic-view.desktop "$pkgdir/usr/share/applications/scenic-view.desktop"

  install -Dm644 org/scenicview/view/images/ui/mglass.png "$pkgdir/usr/share/pixmaps/scenic-view.png"
}
