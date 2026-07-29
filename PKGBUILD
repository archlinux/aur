# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowkick-bin
_pkgname=ChowKick
pkgdesc="Kick synthesizer based on old-school drum machine circuits"
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('BSD')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowkick.lv2-git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-x64-$pkgver.deb")
sha256sums=('2c1328c65bd4af1c188f96d088d71527eccbdc5c434cafe57c8352f53969bb2f')

package() {
	local ext="zst"
	rm -rf usr "data.tar.$ext" "control.tar.$ext" debian-binary
	ar x "${_pkgname}-Linux-x64-$pkgver.deb"
	tar xf "data.tar.$ext"
	cp -r usr "$pkgdir/"
}

