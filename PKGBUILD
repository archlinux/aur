# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Andrews <christophersimonandrews at gmail dot com>
# Contributor: Robson Peixoto <robsonpeixoto at gmail dot com>

pkgname='memstat'
pkgver='1.2'
pkgrel='1'
pkgdesc="Identify what's using up virtual memory"
arch=('i686' 'x86_64')
url='https://packages.debian.org/source/sid/memstat'
license=('GPL')
source=("http://deb.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
_srcdir='memstat'
md5sums=('49bf5aa5f3006310e547a13b3275389a')
sha256sums=('1c70e2108f2c2124b8423cc7588caa0c796fe5413061ae6558682ee3a9357165')

build() {
  cd "${_srcdir}"
  make
}

package() {
  cd "${_srcdir}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/etc"
  make DESTDIR="${pkgdir}/" install
}
