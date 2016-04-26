# Maintainer: zekeer <isoniasid@gmail.com>
pkgname=xneur-fresh
pkgver=0.18.0
pkgrel=1
pkgdesc="X Neural Switcher detects the language of input and corrects keyboard layout if needed"
url="http://www.xneur.ru"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer0.10' 'enchant' 'libnotify' 'gtk3' 'hicolor-icon-theme')
source=("https://launchpad.net/~andrew-crew-kuznetsov/+archive/xneur-stable/+files/xneur_${pkgver}+git5.orig.tar.gz")
md5sums=('e236550817260e42650e551023732705')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr --sysconfdir=/etc \
   	--without-xosd \
	--with-gtk=gtk3
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
    make DESTDIR=${pkgdir} install
}
