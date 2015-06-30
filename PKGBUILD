# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=ntimed-git
pkgver=f3810d7
pkgrel=1
pkgdesc="Network time synchronization software, NTPD replacement"
arch=('any')
url="https://github.com/bsdphk/Ntimed/"
license=(BSD)
provides=('ntimed')
source=('git+https://github.com/bsdphk/Ntimed/') 
sha1sums=('SKIP')
_gitname=Ntimed

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  sh configure
  make
}

package() {
  install -Dm755 ${srcdir}/${_gitname}/ntimed-client ${pkgdir}/usr/bin/ntimed-client
}

# vim:set ts=2 sw=2 et:
