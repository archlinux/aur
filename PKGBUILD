# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2x-bin
pkgver=2.7
pkgrel=4
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
makedepends=('git')
optdepends=('linvstmanager: GUI for managing LinVST bridges')
conflicts=('linvst2s')
replaces=('linvst2s')
source=("https://github.com/osxmidi/LinVst-X/releases/download/2.7/LinVst-X-${pkgver}-Manjaro.zip")
sha256sums=('468fc95ea916b13a83660f6fac2c583457296fa173c1f1f3a993718c64bca339')

package() {
	cd "${srcdir}/LinVst-X-${pkgver}-Manjaro/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
}
