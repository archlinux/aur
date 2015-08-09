# Maintainer: wicast <wicastchen at hotmail dot com>
# Maintainer: Lane Wiscombe <assassin.anex@gmail.com>
# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>

pkgname=xcursor-menda-git
_gitname=menda-cursor
pkgver=r4.e350325
pkgrel=2
pkgdesc="Cursor theme - part of the Manjaro Menda set"
arch=('any')
url="http://www.manjaro.org"
license=('GPL3')
depends=('libxcursor')
makedepends=('binutils' 'git')
provides=('xcursor-menda')
replaces=('xcursor-menda')
conflicts=('xcursor-menda')
source=(git+https://github.com/anexation/${_gitname}.git)
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/menda-cursor
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p $pkgdir/usr/share/icons
    cp -a $srcdir/menda-cursor/Menda-Cursor/ $pkgdir/usr/share/icons/
}

