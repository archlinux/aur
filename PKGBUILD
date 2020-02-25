# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=aget
pkgver=1.0.0
pkgrel=2
pkgdesc='Clone AUR packages without having to remember the URL'
arch=(x86_64)
url='https://github.com/xyproto/aget'
license=(MIT)
makedepends=(go git)
source=("git+https://github.com/xyproto/aget#commit=d1039320aeb70c6d3b57a1450670658da8f961f0") # 1.0.0
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -mod=vendor -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
