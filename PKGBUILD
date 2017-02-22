# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=libcommuni
pkgver=3.5.0
pkgrel=1
epoch=
pkgdesc="A cross-platform IRC framework written with Qt."
arch=('any')
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
source=("libcommuni-v$pkgver.tar.gz::https://github.com/communi/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=(2b62f599800962b2350cbd7ca2fc05ae)
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
