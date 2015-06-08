# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>
pkgname=jenn3d-git
pkgver=r21.d2eae24
pkgrel=2
pkgdesc="A toy for visualizing Coxeter polytopes"
arch=('any')
url="http://www.math.cmu.edu/~fho/jenn/"
license=('GPL2')
depends=('freeglut' 'glu' 'libpng')
install="jenn3d.install"
source=('git+https://github.com/fritzo/jenn3d'
	'jenn.desktop' 'jenn3d.install')
md5sums=(SKIP
	'499c4275fb4ae1afd9a1b034c51ad54d'
	'45ab05125b7409da2768c18182818bb0')

pkgver() {
	cd "jenn3d"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "jenn3d"
	make
}

package() {
	install -D "jenn3d/jenn" "${pkgdir}/usr/bin/jenn"
	install -Dm644 "jenn3d/jenn.png" "${pkgdir}/usr/share/icons/hicolor/72x72/apps/jenn.png"
	install -Dm644 jenn.desktop "${pkgdir}/usr/share/applications/jenn.desktop"
}
