# Maintainer: Colin Wallace <wallacoloo@gmail.com>

pkgname=sparrow3d-git
pkgver=820.143acbc
pkgrel=1
pkgdesc='A software renderer for different open handhelds like the gp2x, wiz, caanoo and pandora'
provides=('sparrow3d')
arch=('any')
url='https://github.com/theZiz/sparrow3d'
license=('LGPL')
depends=()
makedepends=('git')
source=("git+https://github.com/theZiz/sparrow3d.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/sparrow3d
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	cd "$srcdir"/sparrow3d
	make dynamic
	mkdir -p "$pkgdir"/usr/{lib,include}
	# Copy SOs
	cp "$srcdir"/sparrow3d/{libsparrow3d.so,libsparrowNet.so,libsparrowSound.so} "$pkgdir"/usr/lib
	# Copy library header files
	cp "$srcdir"/sparrow3d/sparrow*.h "$pkgdir"/usr/include
}
