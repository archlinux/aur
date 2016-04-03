pkgname=scenic-view
pkgver=8.6.0
pkgrel=2
pkgdesc='A tool for analyzing the scenegraph of a JavaFX application'
arch=('i686' 'x86_64')
url='http://fxexperience.com/scenic-view/'
license=('GPL')
depends=('java-runtime')
source=("http://fxexperience.com/downloads/ScenicView-${pkgver}.zip"
        'scenic-view'
        'scenic-view.desktop')
sha256sums=('cb62998437190fa0d52fe786594f71605673ba0983d12cd99a863d2d8c10e8aa'
            '94f63cb15a84149c2bff3e1ff2644105e0c776a8c9510f7c95c645ca11a40eed'
            'fe496d029e9a748c0ac30a2cb933a939af36874c36a4e07a35de24332858a285')

prepare() {
  jar xf ScenicView.jar
}

package() {
  install -Dm644 ScenicView.jar "$pkgdir/usr/share/java/scenic-view/ScenicView.jar"

  install -Dm755 scenic-view "$pkgdir/usr/bin/scenic-view"
  install -Dm644 scenic-view.desktop "$pkgdir/usr/share/applications/scenic-view.desktop"

  install -Dm644 org/scenicview/view/images/ui/mglass.png "$pkgdir/usr/share/pixmaps/scenic-view.png"
}
