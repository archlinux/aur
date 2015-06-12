pkgname=pam_sasl
pkgver=0.1.2
pkgrel=1
pkgdesc="pam sasl auth module"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/pam-sasl/"
license=('GPL')
depends=(pam libsasl)
options=(!libtool)
source=(http://downloads.sourceforge.net/project/pam-sasl/pam_sasl-$pkgver.tar.gz)
md5sums=('414404d756da70a7a786351092efae1d')

build() {
  cd "$srcdir/pam_sasl-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/pam_sasl-$pkgver"
  make DESTDIR="$pkgdir/" install
}
