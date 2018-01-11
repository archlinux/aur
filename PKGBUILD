# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot de>

pkgname=access-export
pkgver=0.2.0
pkgrel=3
pkgdesc="Export and convert Microsoft® Access® databases (.mdb) to various formats including SQLite"
url=https://github.com/hzpz/access-export
license=(MPL)
arch=(any)
depends=(java-environment bash)
source=(
	$pkgname.jar::https://github.com/hzpz/access-export/releases/download/v$pkgver/access-export-$pkgver.jar
)
noextract=("$pkgname.jar")
sha256sums=('7f87dcb4f177652a2ef99a4f8bc9dd97ced40631e2bba082c38e4af0a7d6212e')

package() {
	# compiled classes
	install -Dm644 $pkgname.jar $pkgdir/usr/lib/$pkgname/$pkgname.jar
	# starter shell script
	install -Dm755 ../$pkgname $pkgdir/usr/bin/$pkgname
}
