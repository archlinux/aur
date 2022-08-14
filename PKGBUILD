# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=base-devel
pkgver=0.0.1
pkgrel=1
pkgdesc='Small utility for listing directories in $PATH'
arch=(x86_64)
url='https://github.com/xyproto/base-devel'
license=(GPL2)
makedepends=(git go)
source=("git+$url#commit=fdf56289b3ad3bd760a1ff55576f03462c44c6b4") # tag: v0.0.1
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" \
    -mod=vendor -trimpath -v
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}
