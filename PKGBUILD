# Maintainer: Philippe Schenker <dev@pschenker.ch>

pkgname=k3conf-git
pkgver=v0.3
pkgrel=1
pkgdesc='Do not use this package it is discontinued'
arch=(x86_64)
url='https://git.ti.com/cgit/k3conf/k3conf/'
license=('BSD3')
makedepends=(
  'cmake'
  'gcc'
  'git'
  'make'
)

source=("")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname%-git}"

  cmake -B build
  make -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 build/k3conf "$pkgdir/usr/bin/k3conf"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
