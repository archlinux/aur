# Maintainer: patataofcourse <patataofcourse@gmail.com>
pkgname="tickompiler-bin"
pkgver="1.10.0_hotfix"
pkgrel=2
pkgdesc="Compiler/decompiler for Tickflow, a language for Rhythm Heaven Megamix"
arch=("any")
url="https://github.com/rhmodding/Tickompiler"
license=('MIT')
depends=("java-runtime=8" "bash")
provides=("tickompiler")
conflicts=()
noextract=(
	"tickompiler.jar"
)
source=(
	"https://github.com/rhmodding/Tickompiler/releases/download/v${pkgver//_/-}/tickompiler.jar"
	"https://gist.githubusercontent.com/patataofcourse/a0b9732e2bb51a1c64c78e134a56745f/raw/4f6767e9373dcd1d3f3b890823309e32386891a0/tickompiler.sh"
	"https://github.com/rhmodding/Tickompiler/blob/v${pkgver//_/-}/LICENSE.txt"
)
sha256sums=(
	"111d645be91848eeab242a51b5dbda0410dd9de210d6005e5e672acd51ff0c56"
	"69f1d339397a62c37e10bdf31cba030f8e484ddd6575e5ba1ab4eac9f8f688d8"
	SKIP
)

package() {
	#cd "$pkgname-$pkgver"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 tickompiler.jar "$pkgdir/usr/share/java/tickompiler/tickompiler.jar"
	install -D tickompiler.sh "$pkgdir/usr/bin/tickompiler"
}
