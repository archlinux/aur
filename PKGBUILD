# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowtapemodel-bin
pkgdesc="Physical modelling signal processing for analog tape recording"
pkgver=2.10.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowtapemodel-vst3-git' 'chowtapemodel-lv2-git' 'chowtapemodel-jack-git' 'chowtapemodel-lv2.git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/AnalogTapeModel/releases/download/v$pkgver/ChowTapeModel-Linux-x64-$pkgver.deb")
sha256sums=('3f1a3f9a58ec341a42daeed927f541c3c41551aee81c00ca118670f448bc3328')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowTapeModel-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

