# Maintainer: Håvard Espeland <espeland@acm.org>
pkgname=libpfm4
pkgver=4.3.0
conflicts=('libpfm3')
pkgrel=1
pkgdesc="The hardware-based performance monitoring interface for Linux."
arch=('x86_64' 'i686')
url="http://perfmon2.sourceforge.net/"
license=('MIT')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-$pkgver.tar.gz"
        'config.mk')
md5sums=('0ab272dbdbb759b852ba8bd06db030ef'
         'ac3806df879a0c99b99574b4011bffab')

build() {
  cd "$srcdir/libpfm-$pkgver"
  cp "${srcdir}/config.mk" .
  make
}

package() {
  cd "$srcdir/libpfm-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m0644 COPYING "${pkgdir}"/usr/share/licenses/libpfm4/LICENSE
}

# vim:set ts=2 sw=2 et:
