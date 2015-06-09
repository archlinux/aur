# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: erm67@yahoo.it

pkgname='raceintospace'
pkgver='1.1'
pkgrel='2'
pkgdesc='The computer version of the Liftoff! board game by Fritz Bronner'
arch=('i686' 'x86_64')
url='http://www.raceintospace.org/'
license='GPL2'
depends=('sdl' 'libvorbis' 'libtheora')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('898fe3ba5c43f6e7b857f5df0093f7a6'
         '11ae024ebc4cf38b5753e351f99aee0d')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package()
{
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install

	# Install menu shortcut
	install -Dm644 os_linux/$pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
