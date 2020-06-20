# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.9.2
pkgrel=2
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('Apache')
provides=('vector')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timberio/vector/releases/download/v${pkgver}/vector-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f0e4f1d4f8c1e081758e4639b5c8dd492194b58a9973c88487825e9cea0e0534')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et: