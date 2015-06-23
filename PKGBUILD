# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=lgogdownloader-git
pkgver=20140830
pkgrel=1
pkgdesc="An open source downloader for GOG.com games, uses the GOG.com API (git version)"
url="http://www.gog.com/en/forum/general/lgogdownloader_gogdownloader_for_linux"
arch=(i686 x86_64)
license=(WTFPL)
depends=('boost' 'jsoncpp' 'liboauth' 'rhash' 'tinyxml' 'htmlcxx' 'curl')
makedepends=('help2man')
source=('git://github.com/Sude-/lgogdownloader.git')
md5sums=('SKIP')
provides=('lgogdownloader')
conflicts=('lgogdownloader')
_gitname="lgogdownloader"

pkgver() {
	date +"%Y%m%d"
}

build() {
	cd $srcdir/${_gitname}

	# Set to debug for more output
	make release

}

package() {
	cd $srcdir/${_gitname}
	
	make DESTDIR=$pkgdir install

	install -D -m 755 $srcdir/${_gitname}/man/${_gitname}.1.gz \
		$pkgdir/usr/share/man/man1/${_gitname}.1.gz
}
