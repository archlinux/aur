# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.28
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "x86_64" "armv7h")
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
depends=("gcc-libs" "glibc")
optdepends=("typst: For typst compilation")
provides=("$_pkgname")
conflicts=("$_pkgname")
source_aarch64=("$_pkgname-arm64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
source_armv7h=("$_pkgname-armhf-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-armhf")
source_x86_64=("$_pkgname-x64-$pkgver::$url/releases/download/v$pkgver/$_pkgname-linux-x64")
sha256sums_aarch64=('0202b2f6706e681678e9a49d51c3b902c1a68f8116b29af49b54621be069b2c0')
sha256sums_x86_64=('d368d8961006ef9d3e24779207c64ddfb0ca57d148eaeda0eb48f5a5447c1e15')
sha256sums_armv7h=('d708b03a5d63aa524508ea5e43b2dd745d7ee868ca19d582bb44596c8538b091')

package() {
	declare -A _arch=(["aarch64"]="arm64" ["armv7h"]="armhf" ["x86_64"]="x64")
	install -Dm755 "$_pkgname-${_arch[$CARCH]}-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
