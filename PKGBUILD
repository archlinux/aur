pkgname=linphone-plugin-msx264
_pkgname=msx264
pkgver=1.5.1
pkgrel=1
pkgdesc="Linphone plugin that enables H.264 video codec"
url="http://www.linphone.org/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://download-mirror.savannah.gnu.org/releases/linphone/plugins/sources/$_pkgname-$pkgver.tar.gz)
depends=('linphone')
options=('!makeflags')
md5sums=('8161005fb75ca6f8ed9a1a798a33e19b')
 
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
