# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.25
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
sha256sums_aarch64=('1cdb2f0d54c0caea7d214369ac64034f0abc7f44158662bad49ca635ced705ad')
sha256sums_x86_64=('d9a82dad60f4c29a6185670a18dd84d42c7f81fa87493e0b9ae18f94230556a9')
sha256sums_armv7h=('49a6c81764e5b977a36b0f6371f840ddc9165bd7ea7ff7344e8a06cff92cd3c4')

package() {
	declare -A _arch=(["aarch64"]="arm64" ["armv7h"]="armhf" ["x86_64"]="x64")
	install -Dm755 "$_pkgname-${_arch[$CARCH]}-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
