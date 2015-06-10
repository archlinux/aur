# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=getver
pkgver=0.33
pkgrel=1
pkgdesc='Utility for finding the latest version number for a given URL'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/getver'
license=('MIT')
makedepends=('git' 'go')
depends=('setconf')
replaces=('bumpver')
conflicts=('bumpver')
provides=('bumpver')
source=("git://github.com/xyproto/getver.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  go build
}

package() {
  cd "$pkgname"

  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -d "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -m755 "scripts/bumpver.sh" "$pkgdir/usr/bin/bumpver"
  install -m755 "scripts/bumprel.sh" "$pkgdir/usr/bin/bumprel"
  install -m755 "scripts/bup.sh" "$pkgdir/usr/bin/bup"
  install -m755 "scripts/geturlver.sh" "$pkgdir/usr/bin/geturlver"
}

# vim:set ts=2 sw=2 et:
