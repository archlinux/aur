# Maintainer: James Groom <OSSYoshiRulz at gmail dot com>
pkgname=bizhawk-monort
_providesName=bizhawk
pkgver=2.5
_archiveName="BizHawk-2.5.0"
pkgrel=1
pkgdesc="A multi-system emulator on .NET. Features rerecording and tools for TASing. (Mono runtime)"
arch=("x86_64")
url="https://gitlab.com/TASVideos/BizHawk#readme"
license=("MIT" "custom")
depends=("glibc" "lsb-release" "mono" "openal")
optdepends=(
	"antimicro: to use unsupported controllers as keyboards"
	"ffmpeg: to use built-in A/V capture, unstable"
)
makedepends=("dotnet-sdk")
provides=("$_providesName=$pkgver")
source=("https://github.com/TASVideos/BizHawk/releases/download/$pkgver/$_archiveName.zip")
sha512sums=("cb35924402932f13f3ed7159bd5991c58790287c856db6958f41b631a36c345c5ddea5249d75560ae608c2900c939579fb395989939f99bf11b4b3b9e2e671ae")

package() {
	cd "$srcdir"
	mkdir -m 777 -p "$pkgdir/opt/$_providesName"
	find . -type f -not -name *.sh -exec install -Dm666 "{}" "$pkgdir/opt/$_providesName/{}" \;
	find . -type f -name *.sh -exec install -Dm777 "{}" "$pkgdir/opt/$_providesName/{}" \;
}
