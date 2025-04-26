# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pla-util
pkgver=2.1.3
pkgrel=2
pkgdesc='A power line adapter utility for Linux'
arch=(x86_64)
url='https://github.com/serock/pla-util'
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs libpcap gcc-ada)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('d48003e52c2e469ec2a0c8baa1ca61654b0071b8569ab77672de94fc683b4f8447cd2226a9bea48e0c6b4104a30e9914860a7f2f07324c220ff06364f9294e0c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 bin/pla-util "$pkgdir"/usr/bin/pla-util
  install -Dm644 completions/pla-util "$pkgdir"/usr/share/bash-completion/completions/pla-util
}

# vim:set ts=2 sw=2 et:
