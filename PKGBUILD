# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=getver
pkgver=0.35
pkgrel=1
pkgdesc='Find the latest version number for a given URL'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/getver/'
license=('MIT')
makedepends=('git' 'go')
depends=('setconf')
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
  install -m755 "scripts/vup.sh" "$pkgdir/usr/bin/vup"
  install -m755 "scripts/geturlver.sh" "$pkgdir/usr/bin/geturlver"
}

# getver: -u 4 github.com/xyproto/getver
# vim:set ts=2 sw=2 et:
