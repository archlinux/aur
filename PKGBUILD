# Maintainer: Andrew Whatson <whatson@gmail.com>
_pkgname=guile_curl
pkgname=${_pkgname//_/-}
pkgver=0.6
pkgrel=1
pkgdesc='A GNU Guile library for client-side URL transfers based on libcurl'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile' 'curl')
url="http://www.lonelycactus.com/guile-curl.html"
source=("http://www.lonelycactus.com/tarball/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e0304f67d66cb4b242a68368ba5b2680980b2a30113575e7337e2224a685addf')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
