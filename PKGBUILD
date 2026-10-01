# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: whiteman808 <whiteman808@paraboletancza.org>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Eric Le Lay <contact@elelay.fr>

pkgname=ansifilter
pkgver=2.24
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64' 'pentium4' 'i486' 'aarch64')
url="https://gitlab.com/saalen/ansifilter"
license=('GPL3')
depends=('glibc' 'gcc-libs')
options=(!debug)
source=("https://gitlab.com/saalen/ansifilter/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('e1f2ae665e49631c30f483e9048d4f6c7fc6f4854d945fbe3c68995c6bf5ec65')

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
