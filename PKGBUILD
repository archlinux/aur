# Maintainer: kaptoxic@yahoo.com
# Contributor: m4sk1n <m4sk1n@vivaldi.net>
# Contributor: Eivind Eide <xenofil A-T gmail D-O-T com>
# Contributor: Renato Coutinho <renato.coutinho@gmail.com>

pkgname=xnots-git
pkgver=r34.g3f3e8d1
pkgrel=2
pkgdesc="A desktop sticky notes application for Unix geeks"
depends=('libxrandr' 'pango' 'xorg-server')
makedepends=('pkg-config' 'git')
source=('git+https://github.com/thePalindrome/xnots.git')
sha256sums=('SKIP')
url="http://xnots.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')

pkgver() {
	cd "$srcdir/xnots"
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/xnots"
	export CFLAGS="-O2"

	make
}

package() {
	cd "${srcdir}/xnots"
	make prefix="$pkgdir/usr/" datadir="$pkgdir/usr/share/doc" install
}
