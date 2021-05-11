# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.2.0
pkgrel=1
pkgdesc='Minimalistic AUR helper'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(MIT)
makedepends=(go git)
source=("git+https://github.com/xyproto/aget#commit=35a6976114013313000b7c1a4c08487936ca7592") # tag: 1.2.0
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
