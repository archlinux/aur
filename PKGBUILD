# Maintainer: Yujŏnja <hardboiled65@gmail.com>
pkgname=hydrogen-theme
pkgver=0.1.1
pkgrel=3
epoch=
pkgdesc="Hydrogen Themes."
arch=('any')
url="https://github.com/orbitrc/Hydrogen"
license=('MIT' 'LGPL3')
groups=()
depends=()
makedepends=('xorg-xcursorgen>=1.0.7' 'inkscape')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/orbitrc/Hydrogen/archive/refs/tags/v0.1.1.tar.gz")
noextract=()
md5sums=('fbe7eb8b72b23da4575098dc20268c91')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	# cd "$pkgname-$pkgver"
	cd "Hydrogen-$pkgver"
	DEBUG=0 make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "Hydrogen-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m 644 "$srcdir/Hydrogen-$pkgver"/cursors/COPYING-ICONS "${pkgdir}"/usr/share/licenses/hydrogen/cursors/COPYING-ICONS
}
