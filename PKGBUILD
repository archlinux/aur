# Maintainer: osch <oliver@luced.de>
pkgname=surge-synthesizer-bin
pkgver=1.6.4.1
debver=1.6.4.1
pkgrel=1
pkgdesc="Surge Synthesizer plugin"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('vst-plugins' 'lv2-plugins')
depends=('cairo'     'fontconfig'          'freetype2'
         'libx11'    'xcb-util-cursor'     'xcb-util'
         'libxcb'    'xcb-util-renderutil' 'xcb-util-image'
         'ttf-lato'  'xdg-utils' 'zenity')
provides=("surge-synthesizer")
conflicts=('surge-synthesizer')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/surge-synthesizer/releases/releases/download/$debver/Surge-linux-x64-$debver.deb")

package() {
	rm -rf usr data.tar
	ar x "Surge-linux-x64-$debver.deb"
	unxz data.tar.xz
	tar xf data.tar
	cp -r usr "$pkgdir/"
}
md5sums=('63974ae5189a9a072180806357b64975')
