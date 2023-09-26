# Maintainer: patataofcourse <patataofcourse@gmail.com>
pkgname="bread-bin"
pkgver="1.4.2"
pkgrel=1
pkgdesc="An editor for the BRCAD and BCCAD formats"
arch=("any")
url="https://github.com/rhmodding/Bread"
license=('apache')
depends=("java-runtime=8" "bash" "java-openjfx=8")
provides=("bread")
conflicts=()
noextract=(
	"bread.jar"
)
source=(
	"https://github.com/rhmodding/Bread/releases/download/v$pkgver/bread.jar"
	"https://gist.githubusercontent.com/patataofcourse/a0b9732e2bb51a1c64c78e134a56745f/raw/55c3690171952c750bca50b3024380ba95991b87/bread.sh"
    "https://raw.githubusercontent.com/rhmodding/bread/v$pkgver/icon.png"
    "bread.desktop"
)
sha256sums=(
	"2369d44dd0e4c6a87c462ecab9e2e006eaa52397151e4301307d0d71b833348e"
	"b8afb7aafe340ad57eef34c252421de09eefe37536b03eeb26194f79738f6a86"
    SKIP
    "d7a6bebe9addab87eedd34499e03b57397d06e835357c86b2c063343cd3834a6"
)

package() {
	#cd "$pkgname-$pkgver"
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/bread.png"
    install -Dm644 bread.desktop "$pkgdir/usr/share/applications/bread.desktop"
	install -Dm644 bread.jar "$pkgdir/usr/share/java/bread/bread.jar"
	install -D bread.sh "$pkgdir/usr/bin/bread"
}
