# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# This script is licensed under an MIT license.
# Creator: John MacFarlane (https://github.com/jgm)

pkgname=lunamark-standalone
pkgver=0.2.0
# The standalone version included in this package is at a lower version number than the latest release of the Lua library version. The separtae lunamark-standalone repository, however, is no longer updated.
_lunamarkver=0.5.0 
pkgrel=1
pkgdesc='Command-line program for conversion of Markdown to other formats (standalone)'
arch=('i686' 'x86_64')
url='https://github.com/jgm/lunamark'
license=('MIT')
provides=('lunamark')
source=("https://github.com/jgm/lunamark/archive/$_lunamarkver.tar.gz")
md5sums=('4b57be78814dda0700c1fedcbace37b6')

build() {
	cd "lunamark-$_lunamarkver"
	make standalone
}

package() {
	mkdir "$pkgdir/usr/bin" -p
	cp "lunamark-$_lunamarkver/standalone/lunamark" "$pkgdir/usr/bin/"
}
