# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2-bin
pkgver=2.8.2
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
groups=('pro-audio')
depends=('wine')
replaces=('linvst2')
conflicts=('linvst' 'linvst-stable' 'linvst2')
provides=('linvst2' "${pkgname}")
source=("https://github.com/osxmidi/LinVst/releases/download/2.8/LinVst-${pkgver}-Debian-Buster.zip")
sha256sums=('3eec4d1bfc522c2d63e97b2c5896d4bdeb67da4a0c9757bcbb43417be37c15ea')

package() {
	cd "${srcdir}/LinVst-${pkgver}-Debian-Buster/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done	
}
