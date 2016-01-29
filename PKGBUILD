# Maintainer: Stephen Cofer <stephendcofer70@gmail.com>

pkgname=shotgun-debugger
pkgver=1.1
pkgrel=1
pkgdesc="A top-down shooter where you must escape a robot facility"
arch=('i686' 'x86_64')
url='http://www.msarnoff.org/sdb/'
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'glu')
source=('https://dl.dropbox.com/u/5833812/sdb/shotgun-debugger-1.1-src.zip'
	'sdb.patch')
md5sums=('13d4755b63762ef54040508946a7c375'
	'fd8d799b8d51d5d5481bb18ed9da13af')

build() {
	patch -p1 < sdb.patch
	cd ShotgunDebuggerSource
	make
}

package() {
	cd ShotgunDebuggerSource
	make DESTDIR=${pkgdir} install
}


