# Maintainer: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.9
pkgrel=1
pkgdesc="Is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7f2505571c9fc8f76609b918106785f61e4a85af184309f738d7d847f1c2a1cf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ENABLE_BTRFS=1
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set ts=2 sw=2 et:
