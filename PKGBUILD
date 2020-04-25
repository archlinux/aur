# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2x-bin
pkgver=2.7.1
pkgrel=2
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's (single wineserver instance variant)"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
makedepends=('git')
optdepends=('linvstmanager: GUI for managing LinVST bridges')
conflicts=('linvst2x')
provides=('linvst2x' "${pkgname}")
source=("https://github.com/osxmidi/LinVst-X/releases/download/2.7/LinVst-X-${pkgver}-Manjaro.zip")
sha256sums=('f83a6a13d50ea55aa32c02b962cf139f3479331fd1f6d5441714cf45c3187125')

package() {
	cd "${srcdir}/LinVst-X-${pkgver}-Manjaro/embedded/"
	for file in *.so; do
        	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
}
