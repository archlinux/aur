# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname="radicle-httpd-bin"
epoch=2
pkgver=0.21.0
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git - web explorer"
arch=("x86_64" "aarch64")
license=("Apache-2.0 OR MIT")
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
source=(
    "$pkgname-$pkgver-LICENSE-MIT::https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
    "radicle-httpd.service"
)
source_x86_64=("https://files.radicle.xyz/releases/radicle-httpd/$pkgver/radicle-httpd-$pkgver-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://files.radicle.xyz/releases/radicle-httpd/$pkgver/radicle-httpd-$pkgver-aarch64-unknown-linux-musl.tar.xz")
sha512sums=('76235a3247342b8531cb259a1a51c9789be81e5332f210949063e4444edc2659eebe0afb0c2aae9e9c6989599d29beca0ca57a7839156c92b195bdb54c7ca448'
            '2596b230b1a2cd097c2596bbc9baea7ba4a18e44364acb098da6e41fee622d4439c7ee397626bb7c377e2f8d7a71aa9c9a22fdea04e217250cccdc3041b76315')
sha512sums_x86_64=('5dacf7869663791d0fd330d55591b9a97c5a7977d83eeb1a34c375d5e8022ae9ac6aae8150074514dd708bda1b32d13537bad707f1c776c12767e17b1fe31bd7')
sha512sums_aarch64=('2f1c59ce3ae1f8f352a5ab5129ea9626f150152e804f1eb58a5712d6229a94bdc91a1e783c8994564c4deca4f76ba2688ea6aa644718cd05550894c8029e1b78')
provides=("radicle-httpd")
conflicts=("radicle-httpd")

package() {
    pushd "radicle-httpd-$pkgver-$CARCH-unknown-linux-musl" >/dev/null
    install -Dm755 "bin/radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
    install -Dm644 "man/man1/radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
    popd >/dev/null
    install -Dm644 "radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
    install -Dm644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
