# Maintainer Alex Mcmillan <linuxguy93@gmail.com>

pkgname=linvst2
pkgver=2.7.2
pkgrel=2
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine' 'python>=3.7')
conflicts=('linvst' 'linvst-stable')
replaces=('linvst' 'linvst-stable')
source=("https://github.com/osxmidi/LinVst/releases/download/2.7/LinVst-${pkgver}-Debian-Stretch.zip"
        "git+https://github.com/usrmusicman/ArchStudioUtils.git")
sha256sums=('SKIP'
            'SKIP')

package() {
	cd "${srcdir}/LinVst-${pkgver}-Debian-Stretch/embedded/"
	for file in *.so; do
	install -Dm755 $file $pkgdir/usr/bin/$file
	done
	for file in *.exe; do
		install -Dm755 $file $pkgdir/usr/bin/$file
	done
	install -Dm755 $srcdir/ArchStudioUtils/w2lvst2 $pkgdir/usr/bin/w2lvst2
}
