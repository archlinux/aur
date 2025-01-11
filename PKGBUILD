# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=nitro-bin
pkgver=23.0.0
pkgrel=1
pkgdesc="An incredible, beautiful, and feature-rich GraphQL IDE"
url="https://chillicream.com/products/nitro/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.chillicream.com/app/Nitro-$pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("86beb0bdd6cd9a6c1d8a02b122da3291db57d9e7673072464d3a2305cb2a49a6e3474686293eca6415671ecc23b9f2ad58658a52964719783de1ae4e2bd8808b"
        "2de3f8321794c97dd62ba6b4ccae367fa101d90578675e89104f80dd74188eaf2f5fe2c70979e0d2717fe4599b74f32275c3d501272a80f0b47e8eeacc7fa8b9")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "Nitro-$pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/nitro"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
