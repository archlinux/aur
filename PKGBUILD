# Contributor: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Square252 <square@0xfc.de>
# Maintainer: Harvey <harv at gmx dot de>

pkgname=jameica-nightly
pkgver=2.11.0
pkgrel=3
pkgdesc="Free Java application platform"
arch=('x86_64')
url="http://www.willuhn.de/products/jameica/"
license=('GPL2')
depends=('java-runtime>=11' 'gtk3')
makedepends=('unzip')
conflicts=('jameica')
source=("http://www.willuhn.de/products/jameica/releases/nightly/jameica-linux64-$pkgver-nightly.zip" "jameica.desktop")
sha256sums=('SKIP'
            'b0221e7463407243d2922107d0de4c437e2037ab0639e2961c443db4f15725fc')

package() {
  install -d "$pkgdir"/usr/share/{java/jameica,applications}
  cp -R "$srcdir"/jameica "$pkgdir"/usr/share/java
  ln -s /usr/share/java/jameica/jameica-linux64.jar \
    "$pkgdir"/usr/share/java/jameica/jameica-linux.jar
  install -m 644 "$srcdir"/jameica.desktop "$pkgdir"/usr/share/applications
}
