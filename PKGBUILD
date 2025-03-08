# Maintainer: Eragon <eragon at eragon dot re>

pkgname=bide
pkgver=4.4
pkgrel=5
pkgdesc="BIDE, Basic IDE by Zezombye"
arch=("any")
url="https://github.com/Zezombye/BIDE"
license=('GPL')
depends=("java-runtime=8")
makedepends=("unzip")
provides=("bide")
source=(
	"${pkgname}-${pkgver}.zip::https://www.planet-casio.com/Fr/logiciels/dl_logiciel.php?id=118&file=1"
	"bide.desktop")
sha256sums=(
	'c1dab3f491405c4d395379e2042ad5eec4507bd50cedf39651cb71fb9a83ec65'
	'3916d089e4aba7483e2a846dd3422b2d6dcd4d187d8b983c2e696d78f0814aaa')

build() {
	unzip -o "${pkgname}-${pkgver}.zip"
	unzip -o BIDE.jar
}

package() {
	mkdir -p $pkgdir/opt/bide
	cp BIDE.jar $pkgdir/opt/bide/bide.jar
	cp images/BIDEicon.png $pkgdir/opt/bide/bide_icon.png
	mkdir -p $pkgdir/usr/share/applications/
	cp bide.desktop $pkgdir/usr/share/applications/bide.desktop
}
