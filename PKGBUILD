# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2-bin
pkgver=2.8
pkgrel=4
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.8')
makedepends=('git')
optdepends=('linvstmanager: GUI for managing LinVST bridges')
conflicts=('linvst' 'linvst-stable' 'linvst2')
replaces=('linvst' 'linvst-stable' 'linvst2')
source=("https://github.com/osxmidi/LinVst/releases/download/2.8/LinVst-${pkgver}-Debian-Stretch.zip")
sha256sums=('7bd075b8e208f633d20173b066542855ade04e9605e189f32a982330998ca51c')

package() {
	cd "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done	
}
