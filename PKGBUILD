# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.0.1
pkgrel=2
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
# source=("https://github.com/Chowdhury-DSP/BYOD/releases/download/v$pkgver/BYOD-Linux-x64-$pkgver.deb")
source=("https://chowdsp.com/nightly_plugins/BYOD-Linux-x64-$pkgver.deb")
sha256sums=('51fffba31cebf2631dc7e3b584735d48c40fac863abfc9f89e6aa64df1d3adec')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "BYOD-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

