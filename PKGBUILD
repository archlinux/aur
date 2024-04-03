# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
_pkgname=BYOD
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'clap-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-x64-$pkgver.deb")
sha256sums=('c1803ae57b717bab04ef2072c10284bcb7d44fbe352d42645075b0c6875c9aeb')

package() {
	local ext="xz"
	rm -rf usr "data.tar.$ext" "control.tar.$ext" debian-binary
	ar x "${_pkgname}-Linux-x64-$pkgver.deb"
	tar xf "data.tar.$ext"
	cp -r usr "$pkgdir/"
}

