# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>
pkgname=cura-resources-fabtotum-git
pkgver=r31.7f76349
pkgrel=1
pkgdesc="FabTotum resources for Cura 2.x"
arch=('any')
url="https://github.com/FABtotum/FAB_Configs"
license=('unknown')
depends=('cura')
makedepends=('git')
source=('git+https://github.com/PaoloP74/FAB_Configs.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/FAB_Configs"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/FAB_Configs"
	cd "`echo Cura*/Cura2.x*`"
	mkdir -p "${pkgdir}/usr/share/cura/resources/"
	cp -rp . "${pkgdir}/usr/share/cura/resources/"
}
