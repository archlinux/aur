# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=strace-unwind
pkgver=4.10
pkgrel=1
pkgdesc="A useful diagnositic, instructional, and debugging tool, with libunwind support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/strace/"
license=('custom')
depends=('perl' 'libunwind')
conflicts=('strace')
source=("http://downloads.sourceforge.net/strace/strace-$pkgver.tar.xz")
md5sums=('107a5be455493861189e9b57a3a51912')

build() {
  cd "${srcdir}/strace-${pkgver}"

  ./configure --prefix=/usr --with-libunwind
  make
}

package() {
  cd "${srcdir}/strace-${pkgver}"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
