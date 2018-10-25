# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=0.7.2
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=('any')
url='https://elfinfo.roboticoverlords.org/'
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/xyproto/elfinfo#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  # Only uses the standard library
  go build
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
