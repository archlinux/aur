# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-beta-bin
pkgver=29.0.0_insider.86
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("d1b1d4e98d881ba9e6f531dbc984e4c44b54fc8704284d2d3a0f1cd23e98f37954f6ad90422725f1cd9168c2ffd5b9ad2244e2227415a91223b49fcb9ddd2725"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
