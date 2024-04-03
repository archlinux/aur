# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowmultitool-bin
_pkgname=ChowMultiTool
pkgdesc="Multi-Tool Audio Plugin"
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'clap-plugins' 'pro-audio')
conflicts=()
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/Chowdhury-DSP/$_pkgname/releases/download/v$pkgver/$_pkgname-Linux-x64-$pkgver.deb")
sha256sums=('69b6718b08a1072d1f27817dace1e07a689a2b8ce7cee9bc9530b107e2343803')

package() {
	local ext="xz"
	rm -rf usr "data.tar.$ext" "control.tar.$ext" debian-binary
	ar x "${_pkgname}-Linux-x64-$pkgver.deb"
	tar xf "data.tar.$ext"
	cp -r usr "$pkgdir/"
}
