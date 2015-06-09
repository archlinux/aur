# Maintainer: Peter Hoeg <firstname at lastname dot com>

pkgname=appc
pkgver=0.5.2
pkgrel=0
pkgdesc="App container tools"
arch=('x86_64')
url="https://github.com/appc/spec"
license=(apache)
makedepends=('go')
provides=('appc')
source=("https://github.com/appc/spec/archive/v${pkgver}.tar.gz")
sha1sums=('9387c4fb3fdde9eeb3e79b5d1af1c58d0bc302f7')

build() {
  cd "spec-${pkgver}"
  ./build
  strip bin/*
}

package() {
  cd "spec-${pkgver}"
  install -Dm755 bin/ace-validator "$pkgdir/usr/bin/ace-validator"
  install -Dm755 bin/actool "$pkgdir/usr/bin/actool"
  install --directory "$pkgdir/usr/share/doc/${pkgname}/examples"
  install *.md "$pkgdir/usr/share/doc/${pkgname}"
  install examples/* "$pkgdir/usr/share/doc/${pkgname}/examples"
}

# vim:set ts=2 sw=2 et:
