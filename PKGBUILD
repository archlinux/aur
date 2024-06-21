# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.27
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
sha256sums_aarch64=('b0f16757284b2f4debf89d8cac1f80b18193737af0a6ef8f9f9f3ccdc73b4bb9')
sha256sums_x86_64=('640f2b23f957450a985467b56afaaf362e8b292dc4482e2ca84753d1a4f9e185')
sha256sums_armv7h=('9b8dbd1d752b3dc6766b59e639a266e81ffb581de35b28d4edc2269beb24b3af')

package() {
	declare -A _arch=(["aarch64"]="arm64" ["armv7h"]="armhf" ["x86_64"]="x64")
	install -Dm755 "$_pkgname-${_arch[$CARCH]}-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
