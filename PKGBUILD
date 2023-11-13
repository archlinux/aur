# Maintainer: Yujŏnja <hardboiled65@gmail.com>
pkgname=primer
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="C++ general purpose library collection."
arch=('x86_64')
url="https://github.com/orbitrc/primer"
license=('MIT')
groups=()
depends=('dbus')
makedepends=('rust' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/orbitrc/primer/archive/refs/tags/v0.4.1.tar.gz")
noextract=()
md5sums=('2f8a0395a0915b52d3868741045ad9cd')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/lib"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -D -m 644 "$srcdir/$pkgname-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/primer/LICENSE
}
