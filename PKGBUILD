pkgname=socalabs-plugins
pkgver=1.0.0
pkgrel=1
pkgdesc="Socalabs VST Plugins (Stable Branch)"
arch=('x86_64')
url="http://www.semanticaudio.co.uk"
license=('BSD')
groups=('pro-audio' 'vst-plugins')
depends=('libglvnd' 'curl' 'freetype2')
_archive=("All_Linux.zip")
source=("${pkgname}_linux.zip::https://socalabs.com/files/get.php?id=${_archive}")
md5sums=('463ec26825432cb2c784df975ff8392b')

package() {
	cd "$srcdir"
	for plugin in *.so; do
		install -Dm755 "$plugin" "$pkgdir/usr/lib/vst/$plugin"
	done
}
