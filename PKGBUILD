# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.1.0
pkgrel=2
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(MIT)
makedepends=(go git)
source=("git+https://github.com/xyproto/aget#commit=6d5d83fcb9cb5e652409436fe5588eb9d10ab3e1") # tag: 1.1.0
b2sums=(SKIP)

build() {
  cd $pkgname
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
