# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=kensaku-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Quick and easy search for Japanese kanji, radicals, and words'
arch=('x86_64')
url="https://github.com/LiteracyFanatic/kensaku"
license=('MIT')
depends=('dotnet-runtime')
options=('!strip')
source=("kensaku-linux-x64-$pkgver::https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku-linux-x64"
        "kensaku-$pkgver.db::https://github.com/LiteracyFanatic/kensaku/releases/download/v$pkgver/kensaku.db")
sha256sums=('deac2bb09470e40ca17620e3dc5e3604e0f56753ec0001f826c22065454df6c8'
            'a0ebb33ffaedc9a78fa79e8d7f5d066ae88ba126125029f2b08e40fa7c155b4e')

package() {
    install -Dm755 "$srcdir/kensaku-linux-x64-$pkgver" "$pkgdir/usr/bin/kensaku"
    install -Dm644 "$srcdir/kensaku-$pkgver.db" "$pkgdir/usr/share/kensaku/kensaku.db"
}
