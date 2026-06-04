# Maintainer: slatkin <slatkin@gmail.com>
pkgname=anus
pkgver=0.1.5
pkgrel=1
pkgdesc='Miniflux desktop reader'
arch=('x86_64')
url='https://github.com/slatkin/anus'
license=('custom')
depends=('webkit2gtk-4.1')
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/slatkin/anus/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('8a4389e8ab27370186eb00e9522add5312b42f60c512dfb7ccfcac1592bc3781')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for sz in 16 32 48 64 128 256; do
    install -Dm644 "icons/${sz}x${sz}/$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$pkgname.png"
  done
}
