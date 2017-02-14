#Maintainer: hellwoofa (at arcor dot de)
#PKGBUILD found at http://tur.berlios.de/pkgbuild/whatah/xbindkeys_config/PKGBUILD thx!
pkgname=xbindkeys_config-gtk2
_pkgname=xbindkeys_config
pkgver=0.1.3
pkgrel=4
pkgdesc="XBindKeys_Config is an easy to use gtk program for configuring \
	Xbindkeys. GTK2 version. "
arch=(i686 x86_64)
url="http://hocwp.free.fr/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('xbindkeys' 'gtk2')
conflicts=('xbindkeys_config')
source=(ftp://ftp.eunet.cz/FreeBSD/ports/distfiles/$_pkgname-$pkgver.tar.gz \
        http://ftp.de.debian.org/debian/pool/main/x/xbindkeys-config/xbindkeys-config_0.1.3-2.diff.gz)
md5sums=('c8983fd822e66c9f9bfbe5e99044a203'
         '7036aeef8276796ebdc04dc6b9bfd914')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -p1 <../xbindkeys-config_0.1.3-2.diff
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
