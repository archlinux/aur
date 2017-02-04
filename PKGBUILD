# Maintainer: Laurent Mouillart <lmouillart@gmail.com
pkgname=gnome-kra-ora-thumbnailer
pkgver=2.0
pkgrel=3
pkgdesc="A thumbnailer for KRA ( Krita native file ) and ORA ( open-raster ) for the Gnome desktop"
makedepends=('git' 'gnome-common' 'automake' 'intltool')
arch=(i686 x86_64)
url="https://github.com/Deevad/gnome-kra-ora-thumbnailer"
license=('DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE')
source=("git://github.com/Deevad/gnome-kra-ora-thumbnailer")
_gitname="gnome-kra-ora-thumbnailer"
noextract=()

build() {
	cd $srcdir/${_gitname}
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

md5sums=('SKIP')
