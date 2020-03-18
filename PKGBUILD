# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vector-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('Apache2')
provides=('vector')
source=("https://github.com/timberio/vector/releases/download/v${pkgver}/vector-x86_64-unknown-linux-musl.tar.gz")
md5sums=('fe24b519a52369b9a6a2e652b4617d5a')

package() {
  cd "${srcdir}/vector-x86_64-unknown-linux-musl"
  install -Dm755 bin/vector $pkgdir/usr/bin/vector
  install -Dm644 etc/systemd/vector.service $pkgdir/etc/systemd/vector.service
  mkdir -p $pkgdir/etc/vector
  cp -aR config/* $pkgdir/etc/vector
}
# vim:set ts=2 sw=2 et: