# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowbyod-bin
_pkgname=BYOD
pkgdesc="Build-your-own guitar distortion!"
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'clap-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-x64-$pkgver.deb")
sha256sums=('e45c7d949279816f7e83dc5b9388109e093ffc5832de01481e1ae24e4d0a3774')

package() {
	rm -rf usr data.tar.zst control.tar.zst debian-binary
	ar x "$_pkgname-Linux-x64-$pkgver.deb"
	tar xf data.tar.zst
	cp -r usr "$pkgdir/"
}

