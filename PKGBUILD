# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=fancy-mouse-boot-rom
pkgver=0.8.0
pkgrel=1
pkgdesc="MCPX boot ROM implementation"
arch=('any')
url="https://github.com/SnowyMouse/fancy-mouse-boot-rom"
license=('GPL2' 'GPL3')
makedepends=('git')
_commit='ebe34c4cb20496b0c735e7795efd6fbf3b6316ff'
source=("$pkgname::git+https://github.com/SnowyMouse/fancy-mouse-boot-rom.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  # binary
  install -vDm644 -t "$pkgdir/usr/lib/$pkgname" bin/*.bin

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
