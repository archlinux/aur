# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=archlabs-wallpapers
pkgver=1.1
pkgrel=10
pkgdesc="Wallpapers for ARCHLabs"
arch=('any')
url="https://github.com/ARCHLabs/Archlabs-Wallpapers"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('archlabs-wallpapers-git')
options=(!strip !emptydirs)
source=('archlabs-wallpapers::git+https://github.com/ARCHLabs/Archlabs-Wallpapers.git')
sha256sums=('SKIP')
prepare()  {
	mkdir -p "${pkgdir}/usr/share/backgrounds/archlabs"
	rm -f "${srcdir}/archlabs-wallpapers/"README.md
	rm -f "${srcdir}/archlabs-wallpapers/"git-v*
}
package() {
	cp -rf "${srcdir}/archlabs-wallpapers/"*.* "${pkgdir}/usr/share/backgrounds/archlabs/"
}
