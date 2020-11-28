
# Maintainer: Alexandru Iercosan-Lucaci <lucaci32u4@gmail.com>

#
# Download the Dungeondraft zip archive from HumbleBundle and place it
# in the same folder with this PKGBUILD and run pkgbuild.
# $ pkgbuild -si
#
# It will work with all current versions of Dungeondraft.
# The version string is detected dinamically when run.
#
# Note: AUR helpers might not be able to use this package.
#       Install manually.
#
#
pkgname=dungeondraft
pkgrel=1

pkgdesc='Dungeondraft is a tabletop encounter map creation tool designed to draw aesthetic maps without the typical frustrations and time investment'

arch=('x86_64')
url='https://dungeondraft.net'
license=('custom:TailwindGamesLicense')

depends=('mono' 'zenity')
makedepends=('unzip')


sourcezip="$(ls . | grep -E '.*Dungeondraft.*..zip' | sort | head -n 1)"
source=("file:///$sourcezip")
md5sums=('SKIP')
pkgver="$(echo "$sourcezip" | grep -oE '[0-9]+(\.[0-9]+)*' | head -n 1)"
package() {
	local destdir="$pkgdir/opt/Dungeondraft"
	mkdir -p "$destdir"
	mv "data_Dungeondraft" "$destdir"
	mv "Dungeondraft.pck" "$destdir"
	mv "Dungeondraft.png" "$destdir"
	mv "Dungeondraft.x86_64" "$destdir"
	chmod a+x "$destdir/Dungeondraft.x86_64"
	mv "EULA.txt" "$destdir"
	mv "example_template.zip" "$destdir"
	mkdir -p "$pkgdir/usr/share/applications"
	mv "Dungeondraft.desktop" "$pkgdir/usr/share/applications"
}


