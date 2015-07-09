# Contributor: dax <dax@deelab.org>

pkgname=gkrellmpager
pkgver=0.2.0
pkgrel=3
pkgdesc="A GKrellM plugin which provides pager functionality for your virtual desktops"
arch=('i686' 'x86_64')
url="http://gkrellmpager.sourceforge.net/"
license=('GPL')
depends=('gkrellm')
source=("http://downloads.sourceforge.net/gkrellmpager/${pkgname}-${pkgver}.tar.gz")
md5sums=('7a19f19c5aa39d7faac2cc95b01b9a63')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make -f <(sed 's/-DVERSION/-fPIC -DVERSION/;s/-W1//' Makefile)
}
package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm644 gkrellmpager.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellmpager.so"
}
