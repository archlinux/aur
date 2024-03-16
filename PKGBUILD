# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.20
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64' 'pentium4' 'i486' 'aarch64')
url="https://gitlab.com/saalen/ansifilter"
license=('GPL3')
depends=('glibc' 'gcc-libs')
options=(!debug)
source=("https://gitlab.com/saalen/ansifilter/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('35ec9d71a7f4e5601337937c7734b32a6e346c0f054f4d316376823cfe679067')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/doc/ansifilter/COPYING" \
     "${pkgdir}/usr/share/doc/ansifilter/INSTALL"
}
