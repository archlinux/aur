# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgname="radicle-httpd-bin"
epoch=2
pkgver=0.29.0
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
sha512sums_x86_64=('e17b45dddbc27075e302a5165c394e35acd97c443f5dde8aecd9f9e321c38d36e7771ac9e2524fd95792785296e62f445b33ae0cabbd9922825e6d35ed8718f9')
sha512sums_aarch64=('43f6004d3eb1dbc55b3c36cf6e70df3ff7125f9d3d61a8b6c598edb812dd743343bb7059e04e799e571c06c4668c452cddaee2caaed56dd0973313bf1ea6fcb3')
provides=("radicle-httpd")
conflicts=("radicle-httpd")

package() {
	install -Dm644 "radicle-httpd.service" "$pkgdir/usr/lib/systemd/user/radicle-httpd.service"
	install -Dm644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

	cd "radicle-httpd-$pkgver-$CARCH-unknown-linux-musl"
	install -Dm755 "bin/radicle-httpd" "$pkgdir/usr/bin/radicle-httpd"
	install -Dm644 "man/man1/radicle-httpd.1" "$pkgdir/usr/share/man/man1/radicle-httpd.1"
}
