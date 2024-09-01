# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname="radicle-httpd-bin"
epoch=2
pkgver="0.17.0"
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git - web explorer"
arch=("x86_64" "aarch64")
license=("Apache-2.0 OR MIT")
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
source_x86_64=(
    "https://files.radicle.xyz/releases/radicle-httpd/$pkgver/radicle-httpd-$pkgver-x86_64-unknown-linux-musl.tar.xz"
    "$pkgname-$pkgver-LICENSE-MIT::https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
    "radicle-httpd.service"
)
source_aarch64=(
    "https://files.radicle.xyz/releases/radicle-httpd/$pkgver/radicle-httpd-$pkgver-aarch64-unknown-linux-musl.tar.xz"
    "$pkgname-$pkgver-LICENSE-MIT::https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
    "radicle-httpd.service"
)
sha256sums_x86_64=('496fe18071b303a14b9991cdce4228a267b670c6997294064c7c84737ddc0ae6'
                   'fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d'
                   '1da5107935e110e8d65178cd0b21d7b2a21649f25c85c7019ee4061fc2169baf')
sha256sums_aarch64=('e5c2140f82ffd4fd3bf71c4d7cba54509f27919f4b5242a9e07d27a31bf99c33'
                    'fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d'
                    '1da5107935e110e8d65178cd0b21d7b2a21649f25c85c7019ee4061fc2169baf')
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
