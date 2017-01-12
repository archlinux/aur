# Maintainer: M0Rf30

pkgname=xen-docs
pkgver=4.7.0
pkgrel=1
pkgdesc="Xen 4 (docs)"
arch=('i686' 'x86_64')
url="http://xen.org/"
license=('GPL')
makedepends=('markdown' 'transfig' 'ghostscript')
conflicts=('xen4' 'xen3' 'xen-hv-tools' 'libxen4')
source=(http://bits.xensource.com/oss-xen/release/${pkgver}/xen-${pkgver}.tar.gz)

package() {
  cd "$srcdir/xen-$pkgver"

  unset CFLAGS LDFLAGS
  ./configure --prefix=/usr --disable-xen --disable-tools --disable-stubdom --enable-docs
  make DESTDIR=$pkgdir install-docs
}
md5sums=('3aa4e01bf37a3a5bc8572907cb88e649')
