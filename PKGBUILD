# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-beta-bin
pkgver=14.0.0_insider.5
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("4a02f5091a286280d00d90f502496cceec6033ce9968157ba182f781ca7bc39feec78a1c4562bcd66186734ec7b3572181529469f2f22e71925a4b27a719b691"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
