# Maintainer: Martin Nyolt <8e3b3cde: google>
pkgname=linphone-plugin-mssilk
_pkgname=mssilk
pkgver=1.1.1
pkgrel=1
pkgdesc="Linphone / mediastreamer plugin that enables Skype's SILK audio codec"
url="http://www.linphone.org/"
arch=('i686' 'x86_64')
license=('GPL')
source=(https://www.linphone.org/releases/sources/plugins/mssilk/$_pkgname-$pkgver.tar.gz)
depends=('mediastreamer')
md5sums=('ad0b441fdd4d6b6a6db41c2b322d5691')
 
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
