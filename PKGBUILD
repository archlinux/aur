# Maintainer: joel <aullidolunar at gmai1 d0t c0m>

_pkgname=devhelp
pkgname=$_pkgname-gtk2
pkgver=2.32.0
pkgrel=1
pkgdesc="API documentation browser for GNOME (gtk2 version)"
arch=(i686 x86_64)
license=('GPL')
url="https://wiki.gnome.org/Apps/Devhelp"
depends=('gtk2' 'libunique' 'libwnck' 'webkitgtk2' 'hicolor-icon-theme' 'gconf')
makedepends=('intltool')
options=('!libtool' '!emptydirs')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname})
source=("http://ftp.acc.umu.se/pub/GNOME/sources/$_pkgname/2.32/$_pkgname-$pkgver.tar.bz2")
sha256sums=('61b342cbaf27379be9baa5df1f34c9464916601ec4378fa7e1c76fcc686553e4')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
