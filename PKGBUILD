#Maintainer: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="yin-git"
pkgver="0.13"
pkgrel=1
pkgdesc="Efficient wayland wallpaper daemon for images, gifs and videos"
arch=("x86_64")
depends=("ffmpeg"  "wayland" "stb")
makedepends=("zig0.14-bin")
source=("git+https://www.github.com/eugenenoble2005/yin.git")
sha256sums=("SKIP")

package() {
	cd $srcdir/yin
	zig build --release=fast
	install -d -m 755 "$pkgdir/usr/bin" && cp zig-out/bin/* "$pkgdir/usr/bin"
}
