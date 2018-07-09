# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail dot com>
# Contributor: Robson Peixoto <robsonpeixoto at gmail dot com>

pkgname='memstat'
pkgver='1.1'
pkgrel='1'
pkgdesc="Identify what's using up virtual memory"
arch=('i686' 'x86_64')
url='http://packages.debian.org/source/sid/memstat'
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha256sums=('fb7e0b69b1b1173b0b0c735d58d2b7ebb50b3ca15cf9e386302700e408192b86')

build() {
  cd 'memstattool'
  make
}

package() {
  cd 'memstattool'
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/etc"
  make DESTDIR="${pkgdir}/" install
}
