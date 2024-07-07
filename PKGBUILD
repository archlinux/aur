# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>
# Old Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=22.0.0
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
options=(!strip)
conflicts=('javafx-scenebuilder')
source=(http://download.gluonhq.com/scenebuilder/$pkgver/install/linux/SceneBuilder-$pkgver.deb)
sha512sums=('52bc2430d9a2e468873e35833624ae0c6987ffb5571c16616f40efbb4303f37c56256c086584c278a3bcfc5b870e831b14ef99a98a5ab501260d22a615ebf3a8')

package() {
	bsdtar -xJ -C $pkgdir -f $srcdir/data.tar.xz

	install -dm755 $pkgdir/usr/{bin,share/{applications,pixmaps}}

	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/scenebuilder
	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/SceneBuilder
	ln -s ../../opt/scenebuilder/lib/scenebuilder-SceneBuilder.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s ../../opt/scenebuilder/lib/SceneBuilder.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

