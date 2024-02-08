# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowtapemodel-bin
_pkgname=ChowTapeModel
pkgdesc="Physical modelling signal processing for analog tape recording"
pkgver=2.11.4
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowtapemodel-vst3-git' 'chowtapemodel-lv2-git' 'chowtapemodel-jack-git' 'chowtapemodel-lv2.git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/AnalogTapeModel/releases/download/v$pkgver/ChowTapeModel-Linux-x64-$pkgver.deb")
sha256sums=('71aaae1c454ac83ac16b248d4cc99c12bf6d11452a87376fcb6b1e79060e3a5c')

package() {
	local ext="xz"
	rm -rf usr "data.tar.$ext" "control.tar.$ext" debian-binary
	ar x "${_pkgname}-Linux-x64-$pkgver.deb"
	tar xf "data.tar.$ext"
	cp -r usr "$pkgdir/"
}

