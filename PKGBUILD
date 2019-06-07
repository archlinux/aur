pkgname=openvas-cli
pkgver=1.4.5
pkgrel=1
pkgdesc="The OpenVAS Command-Line Interface"
arch=('i686' 'x86_64')
url="http://www.openvas.org/"
license=('GPL')
depends=('gtk2' 'openvas-libraries' 'cmake')
options=('!makeflags' '!buildflags')
# The file downloaded is determined by the `/2397/` part. Changing `pkgver`
#  does not change the file downloaded so we hard code the version number to
#  avoid confusion.
source=('http://wald.intevation.org/frs/download.php/file/2397/openvas-cli-1.4.5.tar.gz')
sha1sums=('b04ffd400ddef6021190c61fe32f3f1783c63c5f')

build() {
  cd "$srcdir/openvas-cli-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
}

package() {
  cd "$srcdir/openvas-cli-$pkgver"

  make DESTDIR="$pkgdir/" install
}
