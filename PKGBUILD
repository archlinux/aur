# Maintainer: Husam Bilal <me@husam.dev>

pkgname=slow-git
_pkgname=slow
pkgver=r15.48c1980
pkgrel=1
pkgdesc='A script to simulate slow network connections'
url='https://github.com/ModusCreateOrg/slow'
license=('MIT')
arch=('any')
conflicts=('slow')
provides=('slow')
source=('git+https://github.com/ModusCreateOrg/slow.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 slow $pkgdir/usr/bin/slow
}
