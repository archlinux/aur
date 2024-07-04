# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname="radicle-httpd-bin"
epoch=2
pkgver="0.13.0"
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git - web explorer"
arch=("x86_64" "aarch64")
license=("Apache-2.0 OR MIT")
url="https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5"
_source=(
	"https://files.radicle.xyz/releases/radicle-httpd/$pkgver/radicle-$pkgver-$CARCH-unknown-linux-musl.tar.xz"
	"$pkgname-$pkgver-LICENSE-MIT::https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
	"radicle-httpd.service"
)
source_x86_64=(${_source[@]})
source_aarch64=(${_source[@]})
sha256sums_x86_64=('a20c5a9f2704efeccf582ce75555eca322175491b4d66b0e8f0ecdbd2dddb578'
                   'fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d'
                   '1da5107935e110e8d65178cd0b21d7b2a21649f25c85c7019ee4061fc2169baf')
sha256sums_aarch64=('a20c5a9f2704efeccf582ce75555eca322175491b4d66b0e8f0ecdbd2dddb578'
                    'fff889db903497b59500b5171806c511b3c83df1100532c2f7aa8f96af46cc4d'
                    '1da5107935e110e8d65178cd0b21d7b2a21649f25c85c7019ee4061fc2169baf')
provides=("radicle-httpd")
conflicts=("radicle-httpd")

package() {
	pushd "radicle-$pkgver-$CARCH-unknown-linux-musl" >/dev/null
	install -Dm755 "bin/radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
	install -Dm644 "man/man1/radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
	popd >/dev/null
	install -Dm644 "radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
