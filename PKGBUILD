# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-beta-bin
pkgver=29.0.0_insider.87
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("ee5420b617c36f9d077c7b43035a7b625bd6b60dbcdac940c48e41fe69a733a76170ea80e3cd5a65e6a8b6994e09f052699848f42dab6ae4f83544ad88b2efc4"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
