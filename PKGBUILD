# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>
# Old Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=16.0.0
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
options=(!strip)
conflicts=('javafx-scenebuilder')
source=(http://download.gluonhq.com/scenebuilder/$pkgver/install/linux/SceneBuilder-$pkgver.deb)
sha512sums=('39b2ec33708c42d80d27dd895aaf782c86c2ebaf582ac5838ad0d3460ddafc0c7db8b83fa1428a36e387bfefdce7f06d9ebadf94310423c34e48f50120960470')

package() {
	bsdtar -xJ -C $pkgdir -f $srcdir/data.tar.xz

	install -dm755 $pkgdir/usr/{bin,share/{applications,pixmaps}}

	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/scenebuilder
	ln -s ../../opt/scenebuilder/bin/SceneBuilder $pkgdir/usr/bin/SceneBuilder
	ln -s ../../opt/scenebuilder/lib/scenebuilder-SceneBuilder.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s ../../opt/scenebuilder/lib/SceneBuilder.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

