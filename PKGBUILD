# Maintainer: Valere Monseur <valere dot monseur at ymail dot com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=ktsuss
pkgver=2.1
pkgrel=1
pkgdesc='Graphical version of su written in C and GTK+'
arch=('i686' 'x86_64')
url="https://github.com/nomius/ktsuss"
license=('BSD')
depends=('gtk2')
provides=('ktsuss')
conflicts=('ktsuss-git')
source=("https://github.com/nomius/${pkgname}/releases/download/2.1/${pkgname}-${pkgver}.tar.gz")
md5sums=('47f3fa8a3a25862949ece6f5ba098577')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
