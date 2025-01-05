# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=fancy-mouse-boot-rom
pkgver=0.9.0
pkgrel=1
pkgdesc="MCPX boot ROM implementation"
arch=('any')
url="https://github.com/SnowyMouse/fancy-mouse-boot-rom"
license=('GPL-2.0-only OR GPL-3.0-only')
makedepends=('git')
_commit='b4b62ed6786ea4e39a4dedf94dc340e3df584bc8'
source=("$pkgname::git+https://github.com/SnowyMouse/fancy-mouse-boot-rom.git#commit=$_commit")
sha256sums=('97926d223400b2836c0ce8fa7bc8869f09a2a3b1deb4171a7e5c519c7dab1606')

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
