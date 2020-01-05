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
source=(http://ftp.de.debian.org/debian/pool/main/x/xbindkeys-config/xbindkeys-config_0.1.3.orig.tar.gz \
        http://ftp.de.debian.org/debian/pool/main/x/xbindkeys-config/xbindkeys-config_0.1.3-2.diff.gz)
sha512sums=('95621b4f4cac14c922caa51d15376a7f5223d1e0742efb994d2e1f8ffcf16645bc118ac835ff70be64810309363404b23b9540dee1e0f2a6ba86a5e500230f10'
            '8f05ddebe8697034478727863c356566442c7f6d2f4abdf7016182452b499adfe0e2ac66aff3c2068e6a3f9626ff611362d73750261a742cd1d692bb5df2ecee')

build() {
	gzip -d ../xbindkeys-config_0.1.3-2.diff.gz
	cd "$srcdir/$_pkgname-$pkgver"
	patch -p1 <../xbindkeys-config_0.1.3-2.diff
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
