# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum
pkgver=0.1.21
pkgrel=1
pkgdesc='Check and compare easily the checksum of a file.'
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache License 2.0')
makedepends=('go')
source=('chksum::git+https://gitlab.com/chacas0/chksum#branch=master')
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}