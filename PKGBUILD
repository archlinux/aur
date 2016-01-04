# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=libcommuni
pkgver=3.4.0
pkgrel=1
epoch=
pkgdesc="A cross-platform IRC framework written with Qt."
arch=('x86_64' 'i686')
url="https://communi.github.io/"
license=('custom')
groups=()
depends=('qt5-declarative')
makedepends=()
checkdepends=()
optdepends=()
provides=($pkgname)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("libcommuni.tar.gz::https://github.com/communi/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=(987fa2143324ab3f1843483053bf711f)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
        qmake
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
        mkdir -p "$pkgdir/usr/share/licenses/${pkgname}/"
        install -m644 LICENSE \
                "$pkgdir/usr/share/licenses/${pkgname}/"
}
