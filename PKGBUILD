# Maintainer: dr4Ke <dr4ke at dr4ke dot net>
pkgname=cura-resources-fabtotum-git
pkgver=r27.c4b13cd
pkgrel=1
pkgdesc="FabTotum resources for Cura 2.x"
arch=('any')
url="https://github.com/FABtotum/FAB_Configs"
license=('unknown')
depends=('cura')
makedepends=('git')
source=('git+https://github.com/FABtotum/FAB_Configs.git')
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/FAB_Configs"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/FAB_Configs"
	cd "Cura2.x_configs_FABtotum/Cura 2.5/resources"
	mkdir -p "${pkgdir}/usr/share/cura/resources/"
	cp -rp . "${pkgdir}/usr/share/cura/resources/"
}
