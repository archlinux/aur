# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=gluon-scenebuilder
pkgver=23.0.1
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
options=(!strip)
conflicts=('javafx-scenebuilder')
source=(http://download.gluonhq.com/scenebuilder/$pkgver/install/linux/SceneBuilder-$pkgver.deb)
sha512sums=('5a6e4d6bd46504bc0661d422f49b682853154e2b6fe648963aea59d517fe9372b5605e6e0a488fd38536b3e674ee3bfafd7e9a64bac472536bb872729125e08e')

package() {
	bsdtar -xJ -C $pkgdir -f $srcdir/data.tar.xz

	install -dm755 $pkgdir/usr/{bin,share/{applications,pixmaps}}

	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/scenebuilder
	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/SceneBuilder
	ln -s ../../opt/scenebuilder/lib/scenebuilder-SceneBuilder.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s ../../opt/scenebuilder/lib/SceneBuilder.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

