# Maintainer: Antony Kellermann <antony@aokellermann.dev>
pkgname=bananacakepop-beta-bin
pkgver=15.0.0_insider.4
_pkgver=$(echo $pkgver | tr '_' '-')
pkgrel=1
pkgdesc="A powerful GraphQL IDE that joins you and your team on your GraphQL journey."
url="https://chillicream.com/products/bananacakepop/"
arch=("x86_64")
license=("custom:ChilliCreamLicense1.0")
source=("https://cdn.bananacakepop.com/app/BananaCakePop-$_pkgver-linux-$CARCH.AppImage"
        "LICENSE")
b2sums=("898e111d082c435920c5948e0fe8b29b72d09a9f3a180885c032d4f11041c93002db4c9e05e5c351ef6d67256c04c050dda59faed8afebea11cbfb9d548115a5"
        "65c1186762988ba427d42dc746f97aa9a7ceabc245570aeab701752e675ffec82c4f3718f4f4a116cc92e967bc38cae5df1baf5eb053da045bf2a122de2aeaf6")
options+=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 "BananaCakePop-$_pkgver-linux-$CARCH.AppImage" "$pkgdir/usr/bin/bananacakepop-beta"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
