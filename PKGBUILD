# Maintainer: Engine Feeder <enginefeeder101@gmail.com>
# Contributor: Andreas Krist <group@amok.am>
# Contributor: Xi0N <grayfox.i0n@gmail.com>

pkgname=amok-exif-sorter
pkgver=3.00
pkgrel=1
pkgdesc="AmoK Exif Sorter is the easy but powerful solution for renaming your photos using EXIF data"
arch=('x86_64')
url="http://www.amok.am/en/freeware/amok_exif_sorter/" 
license=('custom')
depends=('java-runtime')

source=("https://www.amok.am/files/releases/AmoK_Exif_Sorter_v${pkgver}_(Linux_64Bit).tar.bz2"
	"amok-exif-sorter.desktop"
	"amok-exif-sorter.ico"
	"amok-exif-sorter")


md5sums=('4eb3621ceca7969f00019fd084006550'
	 '234329004eb631c32c6789dcad08704c'
	 '43d8104af166aefe26016ff011af0f37'
	 'aa5894fe7f60a2cd8f9b157776c72e3b')

package() {
	# Install application
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/java/$pkgname" lib/*.jar exifsorter.jar

	# Install application file
	install -Dm755 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

	# Install icon
	install -Dm644 $pkgname.ico "$pkgdir/usr/share/$pkgname/$pkgname.ico"

	# Install license
	install -Dm644 licenses/exifsorter_license_english.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Install other licenses
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/licenses" licenses/*

	# Install documentation
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/doc" doc/*.html
}
