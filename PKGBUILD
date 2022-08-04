# Maintainer: osch <oliver@luced.de>
pkgname=surge-xt-bin
pkgver=1.1.0
debver=1.1.0
pkgrel=1
pkgdesc="Surge XT Synthesizer Plugin (VST3 & LV2, original binary release)"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('vst3-plugins' 'lv2-plugins' 'pro-audio')
depends=('cairo'     'fontconfig'          'freetype2'
         'libx11'    'xcb-util-cursor'     'xcb-util'
         'libxcb'    'xcb-util-renderutil' 'xcb-util-image'
         'ttf-lato'  'xdg-utils' 'xclip')
provides=('surge-xt')
conflicts=('surge-xt')
options=('!strip' '!libtool' '!emptydirs')
source=("https://github.com/surge-synthesizer/releases-xt/releases/download/$debver/surge-xt-linux-x64-$debver.deb")

package() {
	rm -rf usr data.tar
	ar x "surge-xt-linux-x64-$debver.deb"
	unxz data.tar.xz
	tar xf data.tar
	cp -r usr "$pkgdir/"
}
md5sums=('24e2489b22d93fb6dcd8097f98fb47b9')
