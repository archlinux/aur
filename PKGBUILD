# Maintainer: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>

pkgname=jdupes
pkgver=1.8
pkgrel=2
pkgdesc="jdupes is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f2ba7cfecbc77cb2c43ec490994f3363754b6a84d6a5ca9728a2c33601acd6a0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set ts=2 sw=2 et:
