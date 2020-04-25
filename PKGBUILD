# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2-bin
pkgver=2.8.1
pkgrel=2
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
makedepends=('git')
conflicts=('linvst' 'linvst-stable' 'linvst2')
provides=('linvst2' "${pkgname}")
source=("https://github.com/osxmidi/LinVst/releases/download/2.8/LinVst-${pkgver}-Manjaro.zip")
sha256sums=('76dd35e9fd49e71debed6346c9d812401ecfd358e29f35a10e452c1ceba448c1')

package() {
	cd "${srcdir}/LinVst-${pkgver}-Manjaro/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done	
}
