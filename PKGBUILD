# Maintainer: Jaime Pando Acedo <jaime at jpandoac dot es>
pkgname=naviterm-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A cli client for Navidrome (subsonic)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/detoxify92/naviterm"
license=('GPL-3.0-or-later')
depends=('mpv')
provides=('naviterm')
conflicts=('naviterm')
options=('!debug')
source_x86_64=("naviterm-x86_64-$pkgver.tar.gz::https://gitlab.com/detoxify92/naviterm/-/releases/$pkgver/downloads/binaries/naviterm-amd64")
source_aarch64=("naviterm-aarch64-$pkgver.tar.gz::https://gitlab.com/detoxify92/naviterm/-/releases/$pkgver/downloads/binaries/naviterm-aarch64")
sha256sums_x86_64=('1ea1dcedb50daf1131823dd89ddd85c68ddb8445a685c24df4495f2cf84946dd')
sha256sums_aarch64=('fba08c1ff679b11c3dde57dc7d1761bc8fe8de8be88a7c1a2c8c3a0fb5ded6a0')

package() {
  cd "$srcdir"
  if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf naviterm-x86_64-$pkgver.tar.gz
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf naviterm-aarch64-$pkgver.tar.gz
  fi
  install -Dm755 target/release/naviterm "$pkgdir/usr/bin/naviterm"
}
