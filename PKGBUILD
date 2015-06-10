# Maintainer: Alexander Rødseth <xyproto@archlinux.org>

pkgname=aurtic
pkgver=0.2
pkgrel=1
pkgdesc='Download and extract source packages from AUR'
arch=('x86_64' 'i686')
url='https://github.com/xyproto/aurtic/'
license=('MIT')
makedepends=('go' 'git')
source=("git://github.com/xyproto/aurtic#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

  GOPATH="$srcdir" go get -d
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
