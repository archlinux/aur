# Maintainer: nyxkn <dev@nyxkn.net>
pkgname=chowcentaur-bin
pkgdesc="Digital emulation of the Klon Centaur guitar pedal using RNNs, Wave Digital Filters, and more"
pkgver=1.4.0
pkgrel=1
arch=('x86_64')
url="https://chowdsp.com/"
license=('BSD')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
conflicts=('chowkloncentaurmodel.lv2-git')
depends=('libglvnd' 'freetype2' 'alsa-lib')
source=("https://github.com/jatinchowdhury18/KlonCentaur/releases/download/v$pkgver/ChowCentaur-Linux-x64-$pkgver.deb")
sha256sums=('abd0fda32e5b45f0b144ac3d4559009e3b837a9be0b859d99a82c4bba9c52303')

package() {
	rm -rf usr data.tar.xz control.tar.xz debian-binary
	ar x "ChowCentaur-Linux-x64-$pkgver.deb"
	tar xf data.tar.xz
	cp -r usr "$pkgdir/"
}

