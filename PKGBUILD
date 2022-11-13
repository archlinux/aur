# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.0.9
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
# source=("https://github.com/Chowdhury-DSP/BYOD/releases/download/v$pkgver/BYOD-Linux-x64-$pkgver.deb")
source=("https://chowdsp.com/nightly_plugins/BYOD-Linux-x64-$pkgver.deb")
sha256sums=('75acd7edf08a4d108650d9776d981a8bd0938818da3cdf69e6783eb10224f322')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "BYOD-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

