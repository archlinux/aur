# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgname=servicer-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Simplify service management on systemd"
url="https://github.com/servicer-labs/servicer"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("servicer")
conflicts=("servicer")
depends=(glibc gcc-libs)
_prefix=$pkgname-$pkgver-$pkgrel
source_x86_64=(
	"$_prefix-servicer::$url/releases/download/v$pkgver/servicer-$CARCH-unknown-linux-gnu"
	"$_prefix-LICENSE::https://raw.githubusercontent.com/servicer-labs/servicer/master/LICENSE"
)
source_aarch64=(
	"$_prefix-servicer::$url/releases/download/v$pkgver/servicer-$CARCH-unknown-linux-gnu"
	"$_prefix-LICENSE::https://raw.githubusercontent.com/servicer-labs/servicer/master/LICENSE"
)
sha256sums_x86_64=(
	"4a3fb1d9c04e7bb705c7ce68a89dd625647d5da6937d4ae450321b5acaa62946"
	"2ef4d276242ac95eb4005255e73fce401e38ed70354b15aa53b516195db47151"
)
sha256sums_aarch64=(
	"bdb626724589d71308a73b09dd07357710ff1e9a12659ec3b02f31617cdb54e0"
	"2ef4d276242ac95eb4005255e73fce401e38ed70354b15aa53b516195db47151"
)

package() {
	install -Dm755 $_prefix-servicer -t "$pkgdir/usr/bin"
	install -Dm644 $_prefix-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
