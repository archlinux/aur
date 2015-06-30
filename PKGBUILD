# Maintainer: Yuval Adam <yuv dot adm at gmail dot com> PGP-Key: CC2115C12D99D2F0

pkgname=gascop-git
pkgver=b5af31c
pkgrel=1
pkgdesc="A lightweight POCSAG decoder for rtl-sdr devices"
arch=('any')
url="https://github.com/yuvadm/gascop/"
license=(BSD)
depends=('rtl-sdr')
provides=('gascop')
source=('git+https://github.com/yuvadm/gascop/') 
sha1sums=('SKIP')
_gitname=gascop

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  make
}

package() {
  install -Dm755 ${srcdir}/${_gitname}/gascop ${pkgdir}/usr/bin/gascop
}

# vim:set ts=2 sw=2 et:
