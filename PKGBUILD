# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=getver
pkgver=0.52
pkgrel=2
pkgdesc='Find the latest package versions'
arch=('x86_64')
url='https://github.com/xyproto/getver/'
license=('MIT')
makedepends=('git' 'go')
depends=('pacman-contrib' 'setconf')
source=("git+https://github.com/xyproto/getver.git#tag=$pkgver")
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
  install -m755 "scripts/allversions.sh" "$pkgdir/usr/bin/allversions"
}

# vim: ts=2 sw=2 et:
# getver: raw.githubusercontent.com/xyproto/getver/master/README.md
