# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
_pkgname=typstyle
pkgname=$_pkgname-bin
pkgver=0.11.26
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
sha256sums_aarch64=('9ef5613950c03b8f79bfda4c878a004bc4f99ad695216f14f3e15c86d5e32602')
sha256sums_x86_64=('c0d87e506ddeeb287ce3969c81783189d69342ee2eabfd80d22a456348ee1e37')
sha256sums_armv7h=('62bd895464df558ca1538a76e3e0dc511b77aee009426833ff08fb1b75e7b9f3')

package() {
	declare -A _arch=(["aarch64"]="arm64" ["armv7h"]="armhf" ["x86_64"]="x64")
	install -Dm755 "$_pkgname-${_arch[$CARCH]}-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
