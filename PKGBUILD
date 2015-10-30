# Maintainer: Anthony25 <anthony.ruhier @ gmail.com>

pkgname=pg2ipset-git
pkgver=57.2b14fdf
pkgrel=1
pkgdesc='Converts PG2 IP Blocklists into lists that ipset under Linux can consume'
arch=('any')
license=('GPLv2')
url="https://github.com/ilikenwf/pg2ipset"
provides=('pg2ipset')
conflict=('pg2ipset')
source=('git://github.com/ilikenwf/pg2ipset.git')
md5sums=('SKIP')

_gitname="pg2ipset"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname
  make build

  install -D -m 755 pg2ipset $pkgdir/usr/bin/pg2ipset
}
