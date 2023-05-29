# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowmultitool-bin
_pkgname=ChowMultiTool
pkgdesc="Multi-Tool Audio Plugin"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'clap-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-x64-$pkgver.deb")
sha256sums=('e9d604ba8c5c43d5761b9c73eb0530ac133225591cee8e3c22c58406b33dcd30')

package() {
	rm -rf usr data.tar.zst control.tar.zst debian-binary
	ar x "$_pkgname-Linux-x64-$pkgver.deb"
	tar xf data.tar.zst
	cp -r usr "$pkgdir/"
}

