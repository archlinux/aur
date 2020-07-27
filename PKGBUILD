# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=xorriso
pkgver=1.5.2
pkgrel=1
pkgdesc="Copies file objects from POSIX compliant filesystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise manipulation of such filesystems"
arch=('x86_64')
url='http://scdbackup.sourceforge.net/xorriso_eng.html'
license=('GPL3')
depends=('tk' 'bzip2' 'acl')
source=("${pkgname}-${pkgver}.tar.gz::http://scdbackup.sourceforge.net/xorriso-${pkgver}.tar.gz")
sha256sums=('3b69f5c93ae7c40c5bbe4a847fa3963f5efc9c565551622f77121c5792fc17e7')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}