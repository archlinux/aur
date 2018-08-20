# Maintainer: Aiyion <aur@aiyionpri.me>
pkgname=heimdallr
pkgver="v1.0"
pkgrel=1
pkgdesc="finding public ssh keys with ease"
arch=('x86_64')
url="https://github.com/AiyionPrime/heimdallr"
license=('MIT')
groups=()
depends=('curl' 'json-c' 'libssh')
makedepends=()
checkdepends=()
optdepends=()
provides=('heimdallr')
conflicts=('heimdallr-git')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/AiyionPrime/$pkgname/archive/$pkgver.tar.gz)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
        cd "$pkgname"
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir/" install-bin
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make doc
	install -Dm644 heimdallr.1.gz "$pkgdir/usr/share/man/man1/heimdallr.1.gz"

}

