# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname="radicle-httpd-bin"
epoch=2
pkgver="0.17.0"
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
sha512sums_x86_64=('9738911de49798aa7edd2321427098303eaa630738c7acfb3dbf81754c19b04e847785673ad0d75e18737947ee0b5131fb4a3c305194b6b022e527a430b73e9d')
sha512sums_aarch64=('d286eb95dfa0f7a4866c7f092eeeb77a1366495353a420dc50ec7a82e3d8375d185bd6c5dbe5cadc5ba0061c26ba3b567322d788abe53f975e6d5e41e3fe5e2b')
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
