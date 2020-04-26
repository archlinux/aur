# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=distrho-ports
pkgver=20180416
_pkgver=2018-04-16
pkgrel=2
pkgdesc="DISTRHO Plugin Ports (Stable)"
arch=('x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'LGPL')
groups=('pro-audio' 'lv2-plugins' 'vst-plugins')
depends=('freetype2' 'alsa-lib' 'libxext')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "distrho-vst-git" "distrho-plugins-vst-git" "distrho-lv2-git" "distrho-plugins-lv2-git" "dexed" "dexed-git" "dexed-vst-git" "luftikus" "tal-plugins")
source=("https://github.com/DISTRHO/DISTRHO-Ports/releases/download/${_pkgver}/DISTRHO-Ports-${_pkgver}-linux64.tar.xz")
md5sums=('SKIP')

package() {
	mkdir -p $pkgdir/usr/lib/{vst,lv2}
	
	cd ${srcdir}/DISTRHO-Ports-linux64/vst
	for i in *; do
		cp "$i" "$pkgdir/usr/lib/vst/$i"
	done
	cd ${srcdir}/DISTRHO-Ports-linux64/lv2
        for i in *; do
                cp -r "$i" "$pkgdir/usr/lib/lv2/$i"
        done
}
