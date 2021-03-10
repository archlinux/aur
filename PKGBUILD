# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=fstabfmt
pkgver=1.0.0
pkgrel=1
pkgdesc='Format /etc/fstab files'
arch=(x86_64)
url='https://github.com/xyproto/fstabfmt'
license=(BSD3)
makedepends=(git go)
source=("git+$url#commit=bc167f154ace6022a9bf0879b93f8377dacc6e82") # tag: v1.0.0
sha256sums=(SKIP)

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
