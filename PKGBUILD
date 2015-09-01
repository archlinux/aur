# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=libretro-mednafen-psx-git
_gitname=beetle-psx-libretro
pkgver=819.2b3c5ae
pkgrel=1
pkgdesc="libretro implementation of Mednafen PSX"
arch=('i686' 'x86_64')
url="https://github.com/libretro/beetle-psx-libretro"
license=('custom')
makedepends=('git')
conflicts=('libretro-super-git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"${_gitname}.info::https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/beetle_psx_libretro.info")
md5sums=('SKIP'
	 'SKIP')

build() 
{
	cd "$_gitname"
	make
}

package()
{
	install -v -Dm644 $srcdir/$_gitname.info $pkgdir/usr/lib/libretro/libretro-mednafen-psx.info
	install -v -Dm644 $srcdir/$_gitname/mednafen_psx_libretro.so $pkgdir/usr/lib/libretro/libretro-mednafen-psx.so
}
