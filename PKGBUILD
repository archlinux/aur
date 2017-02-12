# Maintainer: Oliver Hattshire <hattshire at gmail dot com>

pkgname=libsoup-2.2
pkgver=2.2.105
_basepkgname=libsoup
_basepkgver=2.2
pkgrel=1
pkgdesc='HTTP client/server library for GNOME'
url='https://wiki.gnome.org/LibSoup'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=()

optdepends=(  )
conflicts=('')
provides=('libsoup-2.2')
source=("http://ftp.gnome.org/pub/gnome/sources/${_basepkgname}/${_basepkgver}/${_basepkgname}-${pkgver}.tar.bz2"
        "update.patch" )
sha1sums=('SKIP'
          'SKIP')

prepare() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  patch -p1 -i ../update.patch
}
build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}
package() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install 
}
