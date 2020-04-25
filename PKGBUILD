# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst3x-bin
pkgver=1.7.1
pkgrel=2
pkgdesc="enables Windows vst3's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst3"
depends=('wine' 'freetype2' 'xcb-util' 'xcb-util-cursor' 'xcb-util-keysyms' 'libxkbcommon-x11' 'libx11' 'expat' 'gtkmm3' 'sqlite')
makedepends=('git')
optdepends=('linvstmanager: GUI for managing LinVST bridges')
conflicts=('linvst3x')
provides=('linvst3x' "${pkgname}")
source=("https://github.com/osxmidi/LinVst3-X/releases/download/1.7/LinVst3-X-${pkgver}-Manjaro.zip")
sha256sums=('589a661ecec929fc24584d2bfe83f82c7295664d1933c998d0a774bd7889bcff')

package() {
	cd "${srcdir}/LinVst3-X-${pkgver}-Manjaro/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
}
