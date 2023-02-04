# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/BYOD/releases/download/v$pkgver/BYOD-Linux-x64-$pkgver.deb")
sha256sums=('e45c7d949279816f7e83dc5b9388109e093ffc5832de01481e1ae24e4d0a3774')

package() {
	rm -rf usr data.tar.zst control.tar.zst debian-binary
	ar x "BYOD-Linux-x64-$pkgver.deb"
	tar xf data.tar.zst
	cp -r usr "$pkgdir/"
}

