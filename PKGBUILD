# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cdetect
pkgver=0.6.0
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=(x86_64)
url='https://github.com/xyproto/cdetect'
license=(BSD)
makedepends=(go git)
source=("git+https://github.com/xyproto/cdetect#commit=3873c8b2d44a7ccdb3cff780ac4320cbc7af2ccc") # tag: 0.6.0
b2sums=('SKIP')

build() {
  cd $pkgname
  go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags $LDFLAGS"
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
