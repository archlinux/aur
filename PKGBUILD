# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=fstabfmt
pkgver=1.2.0
pkgrel=1
pkgdesc='Format /etc/fstab files'
arch=(x86_64)
url='https://github.com/xyproto/fstabfmt'
license=(BSD3)
makedepends=(git go)
source=("git+$url#commit=0049f00bbb344d0a9df3ee07b04a090014b67eac") # tag: v1.2.0
sha256sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
