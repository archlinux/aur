# Maintainer: Jaime Pando Acedo <jaime at jpandoac dot es>
pkgname=naviterm-bin
pkgver=0.7.1
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
sha256sums_x86_64=('74f8ccd3792cfb3dae6df5c6c01f4446baadcd04ff6f5597f09ee6543a4c935e')
sha256sums_aarch64=('45d57cab4e9d9d0a1c0986a048477e81682128be5d078c1d779871e8d3d81e74')

package() {
  cd "$srcdir"
  if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf naviterm-x86_64-$pkgver.tar.gz
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf naviterm-aarch64-$pkgver.tar.gz
  fi
  install -Dm755 target/release/naviterm "$pkgdir/usr/bin/naviterm"
}
