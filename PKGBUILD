# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=sapphire-butler
pkgver=0.1.1
pkgrel=0
pkgdesc="An extensible task executor that aims to make certain tasks easy and user friendly."
arch=(any)
license=('GPL3')
url='https://codeberg.org/Sapphire/sapphire-butler'
depends=('yad' 'bash' 'packagekit' 'xdg-utils')
source=("https://codeberg.org/Sapphire/sapphire-butler/archive/${pkgver}.tar.gz")
sha256sums=("66cfd6603075c128abe6002a8e6141b988a46b7080572c2aa88d4f12e725e88d")

package() {
	cd "$srcdir/sapphire-butler"
	mkdir -p ${pkgdir}/usr/share/licenses/sapphire-butler/
	cp LICENSE ${pkgdir}/usr/share/licenses/sapphire-butler/
	mkdir -p ${pkgdir}/usr/bin # This can be removed once I add it to the makefile in the next release. This will do, for now.
	make install PREFIX=${pkgdir}
}	
