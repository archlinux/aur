# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sysrss
pkgver=2.2
pkgrel=1
pkgdesc="Let your system generate a maintenance notification RSS"
arch=('any')
url="https://github.com/maandree/sysrss"
license=('GPL3')
depends=('python>=3' 'util-linux')
provides=('sysrss')
conflicts=('sysrss')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maandree/sysrss/tarball/${pkgver}")
sha256sums=('d0f7ca73c368772a01da65751b00a3d34010afa48a831a93b8bad3495b32733e')

build() {
  cd maandree-sysrss-*
  make -B DESTDIR="${pkgdir}/"
}

package() {
  cd maandree-sysrss-*
  make DESTDIR="${pkgdir}/" install
}
