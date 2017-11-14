# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.4.1
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
conflicts=('javafx-scenebuilder')
source=(http://download.gluonhq.com/scenebuilder/$pkgver/scenebuilder-$pkgver-all.jar
        $pkgname.sh
        $pkgname.desktop)
noextract=(scenebuilder-$pkgver-all.jar)
sha512sums=('da0adf86abacef8dca7812cbdcca294488cea5e74ed1810c23ff3de1d968b066d8768a6afcb24a3bb679ad29f93bb9e5730ddc5dc6398ee8f3e8cc6b9cc7d187'
            '2a9dffb0b000ab838455b1846ed760c6a2bca92ac4a2d9cd2b5f064482718d16c89674fec5c32f1049497ec88e924da68af97c59530beede2b6c5e5183b0168c'
            '10fa47683b9301bd8c05dc1af88dd6e4acc33ba61d048e6f05d533b54fa359cfb6f537401b2571954eb5af2f30f408b7b943ffcb5e0039cd395fb18ccabf896d')

package() {
  bsdcpio --extract --make-directories LICENSE com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png < scenebuilder-$pkgver-all.jar

  cd $srcdir

  install -Dm 755 scenebuilder-$pkgver-all.jar $pkgdir/opt/$pkgname/$pkgname.jar
  install -Dm 755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
