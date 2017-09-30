# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=origami-editor-3d
pkgver=1.3.5
_buildtime=1506780703
pkgrel=1
pkgdesc="Virtual paper folding program"
arch=('any')
url="https://sourceforge.net/projects/origamieditor3d/"
license=('GPL3')
depends=('bash' 'java-environment' 'hicolor-icon-theme')
options=('!strip')
# https://downloads.sourceforge.net/project/origamieditor3d/v1.3.5/OrigamiEditor3D.jar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Forigamieditor3d%2F&ts=1506780703&use_mirror=netix
# https://downloads.sourceforge.net/project/origamieditor3d/v1.3.5/OrigamiEditor3D.jar?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Forigamieditor3d%2Ffiles%2Fv1.3.5%2F&ts=1506781254&use_mirror=netix
# http://sourceforge.net/projects/eclipse-cs/files/latest/download?source=files
source=("http://downloads.sourceforge.net/project/origamieditor3d/v${pkgver}/OrigamiEditor3D.jar"
	$pkgname
	$pkgname-icon.png
	$pkgname.desktop
)
sha256sums=('42120355abe26e540cc2cb6e5c3f66136d331499e740024b55ca7cd7c521a98e'
            '1d9cbfa2c678c156b4a49ae7d4f1a6fd2ccaca7e9d9544aeb62443eb80aab2bb'
            '681efe397e4e6581425c15d1afdc099b7f814743b131516fb6c25cb85229d052'
            '210e9d807b81546d88d02431552604f550b482ad7f8a0a4ce517f1f6d20f81d5')

package() {
	# icon, starter shell script, desktop menu entry
	install -Dm644 ../$pkgname-icon.png $pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname-icon.png
	install -Dm755 ../$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 OrigamiEditor3D.jar $pkgdir/usr/lib/${pkgname}/OrigamiEditor3D.jar
}

