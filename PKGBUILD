# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=revanced-builder
pkgver=3.6.0
pkgrel=1
pkgdesc="A NodeJS ReVanced builder"
arch=("x86_64")
url="https://github.com/reisxd/revanced-builder"
license=("GPL-3.0")
depends=("nodejs" "jdk-openjdk")
makedepends=("npm")
optdepends=(
  "android-tools: required only for rooted phones"
  "electron: for opening revanced-builder in a seperate window"
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/reisxd/revanced-builder/archive/refs/tags/v3.6.0.tar.gz"
  "revanced-builder.sh"
  "revanced-builder.desktop"
  "revanced.png::https://user-images.githubusercontent.com/13122796/178031589-aa43db16-46b0-4b75-bff9-cc889fbfbb40.png"
)
sha256sums=(
  "332d117da417a20b521ff91546b668102ba2d2a4c094792c86845c20712983b8"
  "SKIP"
  "SKIP"
  "a619654e2e2d0c017c8a270d0463edf66c1e9d73ab105e52d89434b1356b1f7a"
)

build() {
  cd $pkgname-$pkgver
  npm i
}

package() {
  rm -rf "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  mv -v $pkgname-$pkgver "$pkgdir/opt/$pkgname"
  mv -v revanced-builder.sh "$pkgdir/usr/bin/revanced-builder"
  mv -v revanced-builder.desktop "$pkgdir/usr/share/applications"
  mv -v revanced.png "$pkgdir/usr/share/icons/hicolor/64x64/apps"
}
