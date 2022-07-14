# Maintainer: navigaid <navigaid@gmail.com>
pkgname=k0s
pkgver=0.1.4
pkgrel=1
pkgdesc='Aggregate your personal infrastructure'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/btwiuse/k0s'
license=('Apache')
makedepends=('make' 'go')
source=("https://github.com/btwiuse/k0s/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7c2adea0a05e34d7ce4b258bf3a143538d81782c663db2161c825ab9fb04ed4')

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
