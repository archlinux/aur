# Maintainer: éclairevoyant

_pkgname=btdu
pkgname="$_pkgname-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc='Sampling disk usage profiler for btrfs'
arch=('x86_64' 'aarch64')
url="https://github.com/CyberShadow/$_pkgname"
license=('GPL2')
depends=('ncurses')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.man1::$url/raw/master/btdu.1")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-static-x86_64")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-glibc-aarch64")
b2sums=('27fdc27646a09bd2822d5f6b2acfa15c6caaaeaa1115e91f60f2460231bec4a5843caeb4770311f75cd4c3d3153e025ccf7347f3ecf7c35bc95d74e501a87e27')
b2sums_x86_64=('e35e33764e9473ec2aca0096ff6315d3f142c3f9a7556ba3c8529447cdb85d6b92de9620478094f2d405aa1f9b69605faac741905d3cb63eb309d6f24f1f00ac')
b2sums_aarch64=('48f113ffdc4770237cdc92d092a77b3b3a397795a48040717a4ed31008065c7ef4dad2fd4c61d521c1da9c5a59e6584f7985c7c4f34747f4b0f0c58809318e91')

package() {
	install -Dm755 $pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $pkgname-$pkgver.man1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
