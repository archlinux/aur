# Maintainer: Natrio <natrio@list.ru>

pkgname=whdd-git
_pkgname=whdd
pkgver=3.0.1.r
pkgrel=1
pkgdesc='HDD diagnostic and recovery tool for Linux'
url='https://github.com/whdd/whdd'
arch=(i686 x86_64)
license=(GPL)
conflicts=(whdd)
provides=(whdd)
depends=(dialog ncurses)
optdepends=('smartmontools: for reading SMART attributes')
source=('git+https://github.com/whdd/whdd.git')
md5sums=('SKIP')

pkgver() {
 cd "$_pkgname"
 IFS=- read _v _r < <(git describe)
 echo "$_v.r${_r//-/.}"
}

build() {
 cd "$_pkgname"
 make
}

package() {
 cd "$_pkgname"
 install -Dm755 whdd "$pkgdir/usr/bin/whdd"
}
