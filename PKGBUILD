# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-beta-bin
pkgver=16.0.0_insider.2
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("df91f4d8bc5c91232cc68319e301719600b76c34e2f0dc17e0c0f7a17a6259e17d19aeafcf524067d75aec39b8fd3fe2afcdd93ad6c3fd1c14be1ae928f898a7"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
