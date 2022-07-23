# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowtapemodel-bin
pkgdesc="Physical modelling signal processing for analog tape recording"
pkgver=2.11.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowtapemodel-vst3-git' 'chowtapemodel-lv2-git' 'chowtapemodel-jack-git' 'chowtapemodel-lv2.git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/AnalogTapeModel/releases/download/v$pkgver/ChowTapeModel-Linux-x64-$pkgver.deb")
sha256sums=('d1e60eb720b5fa679415d2995841db7b6099efd02b9d3fdd4b2b8f362b0896d5')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowTapeModel-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

