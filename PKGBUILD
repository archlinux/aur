# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
pkgname=dartaotruntime-bin
pkgver=2.13.4
pkgrel=1
pkgdesc="Run AOT compiled Dart programs without the Dart SDK"
arch=('x86_64')
url="https://dart.dev"
license=('BSD')
conflicts=('dart')
source=("$pkgname-$pkgver-64.zip::https://storage.googleapis.com/dart-archive/channels/stable/release/$pkgver/sdk/dartsdk-linux-x64-release.zip")
noextract=("$pkgname-$pkgver-64.zip")
sha512sums=('f9c8f3b3528548fda5e575d1e384d90321a14782fadc7e8c98b551afcb5ef3a0d7a371cadd495efe281b8b3cd0dc466db54beb250f111ef8b6092e9494d288cd')

prepare() {

    bsdtar -qxf "$pkgname-$pkgver-64.zip" "dart-sdk/LICENSE" "dart-sdk/bin/dartaotruntime"

}

package() {

  install -D "dart-sdk/bin/dartaotruntime" "$pkgdir/usr/bin/dartaotruntime"

  # BSD License
  install -Dm644 "dart-sdk/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
