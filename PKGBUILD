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
	cd "$srcdir/arch-plymouthize"
	install -Dm755 "$srcdir/arch-plymouthize.sh" "$pkgdir/usr/bin/arch-plymouthize"
	install -Dm644 "$srcdir/arch-plymouthize.1" "$pkgdir/usr/share/man/man1/arch-plymouthize.1"
	install -Dm644 "$srcdir/copyright.txt" "$pkgdir/usr/share/licenses/arch-plymouthize"
	install -Dm644 "$srcdir/arch-plymouthize.desktop" "$pkgdir/usr/share/applications/arch-plymouthize.desktop"
	cd "$srcdir/arch-plymouthize/arch-plymouthize"
	mkdir -p "$pkgdir/usr/share/arch-plymouthize/"
	install -Dvm644 * "$pkgdir/usr/share/arch-plymouthize/"
}
