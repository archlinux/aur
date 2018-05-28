# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=cpy
pkgver=0.1
pkgrel=1
pkgdesc='Alternative C/C++ syntax and tooling'
arch=('any')
url="https://github.com/vrsperanza/CPY"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/vrsperanza/CPY.git#commit=3ef591103d24408a1512a44ada2d50d4bb1b6e86")
sha256sums=('SKIP')

build() {
  make -C CPY/Source
}

package() {
  msg2 'Packaging executable...'
  install -Dm755 CPY/Source/cpy "$pkgdir/usr/bin/cpy"

  msg2 'Packaging source code samples...'
  install -d "$pkgdir/usr/share/doc/cpy/samples"
  cp -r CPY/Examples/* "$pkgdir/usr/share/doc/cpy/samples/"

  msg2 'Packaging license...'
  install -Dm644 CPY/LICENSE "$pkgdir/usr/share/licenses/cpy/LICENSE"
}

# vim: ts=2 sw=2 et:
