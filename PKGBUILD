# Maintainer: Frank Großgasteiger <frank@grossgasteiger.de>
pkgname=xgifwallpaper
pkgver=0.1.0
pkgrel=1
pkgdesc="Use an animated GIF as wallpaper on X11 systems"
arch=("x86_64")
url="https://github.com/calculon102/xgifwallpaper"
license=("GPL-3.0 License")
depends=("gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxdmcp" "libxinerama" "libxext")
makedepends=("rust")
source=(git+${url}#commit=fec3a7c34d7bc86db82332cd345b992931af508a)
sha256sums=('SKIP')

build() {
	cd $pkgname
  	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd $pkgname
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

