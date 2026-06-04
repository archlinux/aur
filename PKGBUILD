# Maintainer: slatkin <slatkin@gmail.com>
pkgname=goflux
pkgver=0.1.1
pkgrel=1
pkgdesc='Miniflux desktop reader'
arch=('x86_64')
url='https://github.com/slatkin/goflux'
license=('custom')
depends=('webkit2gtk-4.1')
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/slatkin/goflux/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('5b07d65b14818c600d77902061cf07e9d3dfd4cc579e4bfcda2ea006e2d8f5b1')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for sz in 16 32 48 64 128 256; do
    install -Dm644 "icons/${sz}x${sz}/$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$pkgname.png"
  done
}
