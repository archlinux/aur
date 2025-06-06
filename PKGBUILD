# Maintainer: Jaime Pando Acedo <jaime at jpandoac dot es>
pkgname=naviterm-bin
pkgver=0.3.0
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
sha256sums_x86_64=('e5af9e3fd2f359b7158c3591d825f50f26d33c2554d4176e1a2ddc770e61b21f')
sha256sums_aarch64=('9465f9307f2a25f6056b4158409b3a24c387027a66d1dae9bdee494ddffa53c3')

package() {
  cd "$srcdir"
  if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf naviterm-x86_64-$pkgver.tar.gz
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf naviterm-aarch64-$pkgver.tar.gz
  fi
  install -Dm755 target/release/naviterm "$pkgdir/usr/bin/naviterm"
}
