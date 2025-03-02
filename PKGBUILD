# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-beta-bin
pkgver=25.0.0_insider.10
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("d4bddb894c16275963ff5df3e2bf50497197a4dfba0a994372de8bf6d492bd67d0527ae809fd45beeb1c90947c63bf1072dce6c264bd6d3f62010cc8c21afc3b"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
