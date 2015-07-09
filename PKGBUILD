# Contributor: Sergey Kolesov <cucullus.at.mail.ru>
# Previously contributed by StormBlast and Vyazovoi

pkgname=xneur
pkgver=0.17.0
pkgrel=1
pkgdesc="X Neural Switcher detects the language of input and corrects keyboard layout if needed"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer0.10' 'enchant' 'libnotify' 'gtk2' 'hicolor-icon-theme')
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/xneur-stable/+files/xneur_${pkgver}.orig.tar.gz")

md5sums=('443bfa167471b0d3985d8199dfb4ca5c')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr --sysconfdir=/etc \
   	--without-xosd \
	--with-gtk=gtk2
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
    make DESTDIR=${pkgdir} install
}
