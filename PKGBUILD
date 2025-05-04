# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-beta-bin
pkgver=28.0.0_insider.23
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("bb0c09dbec9ca9ab23a548bb14bb1d44cb79313860f89c0614edec928a01796415505b5d1944df8be6a9f9780cb53f721e847a548aa2135793d48ae970e93dd0"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
