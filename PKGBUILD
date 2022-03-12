# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowkick-bin
pkgdesc="Kick synthesizer based on old-school drum machine circuits"
pkgver=1.1.1
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('BSD')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowkick.lv2-git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/ChowKick/releases/download/v$pkgver/ChowKick-Linux-x64-$pkgver.deb")
sha256sums=('06da605ff68b42cdb7dcad4fa2601d3e6f4287507f281396af20d5ac3205ff97')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowKick-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

