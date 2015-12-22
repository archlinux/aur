# Maintainer: Martin Nyolt <8e3b3cde: google>
pkgname=linphone-plugin-mssilk
_pkgname=mssilk
pkgver=1.0.2
pkgrel=1
pkgdesc="Linphone / mediastreamer plugin that enables Skype's SILK audio codec"
url="http://www.linphone.org/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://download-mirror.savannah.gnu.org/releases/linphone/plugins/sources/$_pkgname-$pkgver.tar.gz)
depends=('mediastreamer')
md5sums=('f1df83849b8e355e4c6a4c29c44250cb')
 
build() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
autoreconf --force --install
./configure --prefix=/usr
 
make
}
 
package() {
 
cd "$srcdir/$_pkgname-$pkgver"
 
make PACKAGE_PLUGINS_DIR=\$\(libdir\)/liblinphone/plugins DESTDIR="$pkgdir" install
}
