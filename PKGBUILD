# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgname=morphoj
pkgver=1.07a
pkgrel=1
pkgdesc="MorphoJ is an integrated program package for doing geometric morphometrics"
arch=('x86_64')
depends=(
	'java-runtime'
)
url="https://morphometrics.uk/MorphoJ_page.html"
license=('Apache License version 2')
source=("https://morphometrics.uk/MorphoJ_stuff/download.php?get=MorphoJ-installer_Unix_Linux.jar" "MorphoJ.desktop" "MorphoJ")
sha256sums=('73c2555706842eb0a8885c11acce09042feee292a53afe6c9ba74724c6fc5bc4'
            '8d8446303b264ec7da0d8453d80a4ed4310a36248dbe1b5c6a98b174746263c5'
            '06398e7d78d84b6a6a9412379613600fe014cbf2950a0f8aff50e9e90f361165')

package() {
	mkdir -p $pkgdir/usr/{bin,share/$pkgname}
	java -DINSTALL_PATH=$pkgdir/usr/share/$pkgname -jar download.php?get=MorphoJ-installer_Unix_Linux.jar -options-system
	install -Dm755 $srcdir/MorphoJ.desktop $pkgdir/usr/share/applications/MorphoJ.desktop
	chmod +x $srcdir/MorphoJ
	install -Dm755 $srcdir/MorphoJ $pkgdir/usr/bin/MorphoJ	
}
