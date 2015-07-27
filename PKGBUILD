# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail dot com>
# Contributor: Robson Peixoto <robsonpeixoto at gmail dot com>

pkgname='memstat'
pkgver='1.0'
pkgrel='2'
pkgdesc="Identify what's using up virtual memory"
arch=('i686' 'x86_64')
url='http://packages.debian.org/source/sid/memstat'
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94')

build() {
  cd "${srcdir}/memstattool"
  make
}

package() {
  cd "${srcdir}/memstattool"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/etc"
  make DESTDIR="${pkgdir}/" install
}
