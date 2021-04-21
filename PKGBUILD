# Maintainer: osch <oliver@luced.de>
pkgname=surge-synthesizer-bin
pkgver=1.9.0
debver=1.9.0
pkgrel=1
pkgdesc="Surge Synthesizer plugin (VST3, original binary release)"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('vst3-plugins' 'pro-audio')
depends=('cairo'     'fontconfig'          'freetype2'
         'libx11'    'xcb-util-cursor'     'xcb-util'
         'libxcb'    'xcb-util-renderutil' 'xcb-util-image'
         'ttf-lato'  'xdg-utils' 'zenity')
provides=("surge-synthesizer")
conflicts=('surge-synthesizer' 'surge')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/surge-synthesizer/releases/releases/download/$debver/Surge-linux-x64-$debver.deb")

package() {
	rm -rf usr data.tar
	ar x "Surge-linux-x64-$debver.deb"
	unxz data.tar.xz
	tar xf data.tar
	cp -r usr "$pkgdir/"
}
md5sums=('47295ad8f4f7577c07349bda48cec067')
