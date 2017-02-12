# Maintainer: Oliver Hattshire <hattshire at gmail dot com>
# Contributor: Corrado 'bardo' Primier <corrado.primier@mail.polimi.it>
# Contributor: pressh <pressh at gmail dot com>

pkgname=libsexymm
pkgver=0.1.9
pkgrel=3
pkgdesc="C++ bindings for libsexy"
arch=('i686' 'x86_64')
url="http://osiris.chipx86.com/projects/libsexy"
license=('GPL')
depends=('gtkmm>=2.18.2' 'libsexy>=0.1.11')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://releases.chipx86.com/libsexy/libsexymm/${pkgname}-${pkgver}.tar.gz)
md5sums=('77c8ae69084e478a6b090ec6e5ae26bf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
