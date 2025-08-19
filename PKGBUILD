# Maintainer: Jaime Pando Acedo <jaime at jpandoac dot es>
pkgname=naviterm-bin
pkgver=0.5.0
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
sha256sums_x86_64=('eeec94be7814d827589b3a57cf377fc13016d28086bd6edc4d8b1e44e806c568')
sha256sums_aarch64=('e88df1ef5ff04db34e1cb01e364857f40d5629527d519fd6841f8f4c6a4a788b')

package() {
  cd "$srcdir"
  if [[ "$CARCH" == "x86_64" ]]; then
    tar -xzf naviterm-x86_64-$pkgver.tar.gz
  elif [[ "$CARCH" == "aarch64" ]]; then
    tar -xzf naviterm-aarch64-$pkgver.tar.gz
  fi
  install -Dm755 target/release/naviterm "$pkgdir/usr/bin/naviterm"
}
