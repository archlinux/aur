#
# Maintainer: eiNjel <alekw3@gmail.com>
#

pkgname=arch-plymouthize
_pkgname=arch-plymouthize
pkgver=1.5.5
pkgrel=5
pkgdesc="A GUI program made for manipulating Plymouth on Arch Linux"
url="alekw3@gmail.com"

arch=('x86_64')
license=('GPL')

depends=('xorg-xrandr' 'xterm' 'gksu' 'tar' 'qt5-base' 'sudo' 'sed')
optdepends=('ttf-dejavu')

options=('!libtool' '!emptydirs')

provides=('arch-plymouthize')
conflicts=('arch-plymouthize')

source=('git+https://bitbucket.org/eiNjel/arch-plymouthize')
      
sha256sums=('SKIP')

prepare() {
	cd "$srcdir"/
}

build() {
	cd "$srcdir"/
}

package() {
	install -Dvm755 "$srcdir/arch-plymouthize/arch-plymouthize.sh" "/usr/bin/arch-plymouthize"
	install -Dvm644 "$srcdir/arch-plymouthize/arch-plymouthize.1" "/usr/share/man/man1/arch-plymouthize.1"
	install -Dvm644 "$srcdir/arch-plymouthize/copyright.txt" "/usr/share/licenses/arch-plymouthize"
	install -Dvm644 "$srcdir/arch-plymouthize/arch-plymouthize.desktop" "/usr/share/applications/arch-plymouthize.desktop"
	mkdir -p "/usr/share/arch-plymouthize/"
	for N in "$srcdir/arch-plymouthize/arch-plymouthize/*"; do
		install -Dvm644 $N "/usr/share/arch-plymouthize/"
	done;
}
