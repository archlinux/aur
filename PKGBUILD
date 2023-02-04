# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowtapemodel-bin
pkgdesc="Physical modelling signal processing for analog tape recording"
pkgver=2.11.1
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowtapemodel-vst3-git' 'chowtapemodel-lv2-git' 'chowtapemodel-jack-git' 'chowtapemodel-lv2.git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/AnalogTapeModel/releases/download/v$pkgver/ChowTapeModel-Linux-x64-$pkgver.deb")
sha256sums=('3215a84da15f76cc5bd6451c93a865e58095c6a1365d573b64f82586a8e8b51d')

package() {
	rm -rf usr data.tar.zst control.tar.zst debian-binary
	ar x "ChowTapeModel-Linux-x64-$pkgver.deb"
	tar xf data.tar.zst
	cp -r usr "$pkgdir/"
}

