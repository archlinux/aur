# Maintainer: E5ten

pkgname=libvlccore
pkgver=9.0.0
pkgrel=2
pkgdesc="The core VLC library that libvlc depends on not bundled with VLC so one can use things depending on the lib without installing VLC"
arch=('x86_64')
url='https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__core.html'
license=('LGPL')
depends=('libidn' 'dbus')
conflicts=('vlc')
source=("https://mex.mirror.pkgbuild.com/extra/os/x86_64/vlc-3.0.1-2-$CARCH.pkg.tar.xz")
md5sums=('a906947ae388875fdd08a68ac6ee4c1c')

package() {
	cd $srcdir/usr/lib
	mkdir -p $pkgdir/usr/lib
	cp $pkgname.so.$pkgver $pkgdir/usr/lib/
	ln -s /usr/lib/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so.9
	ln -s /usr/lib/$pkgname.so.$pkgver $pkgdir/usr/lib/$pkgname.so
}