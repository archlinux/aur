# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=cdetect
pkgver=0.5.4
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=('x86_64')
url='https://github.com/xyproto/cdetect'
license=(MIT)
makedepends=(go git)
source=("git+https://github.com/xyproto/cdetect#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
