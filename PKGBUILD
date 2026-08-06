# Maintainer: Jaime Pando Acedo <jaime at jpandoac dot es>
pkgname=naviterm-bin
pkgver=0.7.3
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
sha256sums_x86_64=('144b842952b74bf4d967caa914031e16f16cd1c948bd411b1d696fbf1c1879e2')
sha256sums_aarch64=('31239bed6aca751c83253dbdf36ab5492f6b1998934a86612609b156976c9413')

package() {
  cd "$srcdir"
  if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf naviterm-x86_64-$pkgver.tar.gz
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf naviterm-aarch64-$pkgver.tar.gz
  fi
  install -Dm755 target/release/naviterm "$pkgdir/usr/bin/naviterm"
}
