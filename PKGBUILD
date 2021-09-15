# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=sapphire-butler
pkgver=0.2
pkgrel=0
pkgdesc="An extensible task executor that aims to make certain tasks easy and user friendly."
arch=(any)
license=('GPL3')
url='https://codeberg.org/Sapphire/sapphire-butler'
depends=('yad' 'bash' 'packagekit' 'xdg-utils')
source=("https://codeberg.org/Sapphire/sapphire-butler/archive/${pkgver}.tar.gz")
sha256sums=("28fcb3f75a2107ef21c12ef1c8d68e5f7831f120e38b061d0deaa29114575bca")

package() {
	cd "$srcdir/sapphire-butler"
	mkdir -p ${pkgdir}/usr/share/licenses/sapphire-butler/
	cp LICENSE ${pkgdir}/usr/share/licenses/sapphire-butler/
	mkdir -p ${pkgdir}/usr/bin # This can be removed once I add it to the makefile in the next release. This will do, for now.
	make install PREFIX=${pkgdir}
}	
