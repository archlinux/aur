# Maintainer: Jack Rubacha <rubacha.jack03@gmail.com>
pkgname=dartaotruntime-bin
pkgver=2.17.6
pkgrel=1
pkgdesc="Run AOT compiled Dart programs without the Dart SDK"
arch=('x86_64')
url="https://dart.dev"
license=('BSD')
conflicts=('dart')
source=("$pkgname-$pkgver-64.zip::https://storage.googleapis.com/dart-archive/channels/stable/release/$pkgver/sdk/dartsdk-linux-x64-release.zip")
noextract=("$pkgname-$pkgver-64.zip")
sha512sums=('6712b6e3691dc241846f8c1353d2bd88cd24c4b37bca3050266cc88e119f9ab5a041aee896db43f00c73ecf93bf8078fe1159b832717465263e188744e874b24')

prepare() {

    bsdtar -qxf "$pkgname-$pkgver-64.zip" "dart-sdk/LICENSE" "dart-sdk/bin/dartaotruntime"

}

package() {

  install -D "dart-sdk/bin/dartaotruntime" "$pkgdir/usr/bin/dartaotruntime"

  # BSD License
  install -Dm644 "dart-sdk/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
