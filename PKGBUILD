# Maintainer: navigaid <navigaid@gmail.com>
pkgname=k0s
pkgver=0.1.1
pkgrel=1
pkgdesc='Aggregate your personal infrastructure'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/btwiuse/k0s'
license=('Apache')
makedepends=('make' 'go')
source=("https://github.com/btwiuse/k0s/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd4c632fb7b5d5f550ae6152080bfb4328c746a29f4b1ada5d6e3fead385daaf')

prepare() {
  true
}

build() {
  cd ${pkgname}-${pkgver}
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 $(realpath bin/k0s) "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
