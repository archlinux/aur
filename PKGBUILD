# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: void09  <sgmihai@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: triaxx

pkgname=gnuclad
pkgver=0.2.4.p1
pkgrel=1
pkgdesc="Cladogram tree generator mainly used by Linux and BSD distribution timeline projects"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
license=(GPL)
url="https://launchpad.net/gnuclad"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FabioLolix/gnuclad/archive/${pkgver}.tar.gz")
sha256sums=('fa29cf5d551b6014cb7f9886b891319531848691e8f68256e098ba26845179f3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D doc/man/gnuclad.1 "${pkgdir}"/usr/share/man/man1/gnuclad.1
}
