# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=safe-plugins
pkgver=1.32
pkgrel=2
pkgdesc="Semantic Audio Feature Extraction VST plugins (Stable Branch)"
arch=('x86_64')
url="http://www.semanticaudio.co.uk"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libglvnd' 'curl' 'freetype2')
conflicts=('safeplugins-git')
_archive=("SAFEPlugins-${pkgver}-LinuxVST-64Bit")
source=("https://github.com/semanticaudio/SAFE/releases/download/${pkgver}/${_archive}.tar.gz")
md5sums=('c59d0b238f70e01fd2d8b84324f6d467')

package() {
	cd "$srcdir/${_archive}"
	for plugin in Compressor Distortion Equaliser Reverb; do
		install -Dm755 "SAFE$plugin.so" "$pkgdir/usr/lib/vst/SAFE$plugin.so"
	done
	install -Dm644 GPL-V3.txt "$pkgdir/usr/share/doc/${pkgname}/GPL-V3"
	install -Dm644 SAFE_User_Manual.pdf "$pkgdir/usr/share/doc/${pkgname}/SAFE_User_Manual.pdf"
}

