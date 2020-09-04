# Maintainer: Frank Großgasteiger <frank@grossgasteiger.de>
pkgname=xgifwallpaper
pkgver=0.1.1
pkgrel=2
pkgdesc="Use an animated GIF as wallpaper on X11 systems"
arch=("x86_64")
url="https://github.com/calculon102/xgifwallpaper"
license=("GPL-3.0")
depends=("gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxdmcp" "libxinerama" "libxext")
makedepends=("gcc" "git" "rust")
source=(git+${url}#commit=b50aa30aea696cbe8c79a6578f9ef2bac77b7f64)
sha256sums=('SKIP')

build() {
	cd $pkgname
  	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd $pkgname
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

