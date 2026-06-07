# Maintainer: slatkin <slatkin@gmail.com>
pkgname=anus
pkgver=0.3.7
pkgrel=1
pkgdesc='Miniflux desktop reader'
arch=('x86_64')
url='https://github.com/slatkin/anus'
license=('MIT')
depends=('webkit2gtk-4.1')
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/slatkin/anus/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c6007578821c14a61f00477a6303b3fc81d99d37868f48bb53114a24cdfac451')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for sz in 16 32 48 64 128 256; do
    install -Dm644 "icons/${sz}x${sz}/$pkgname.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/$pkgname.png"
  done

  install -Dm644 "$pkgname.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
