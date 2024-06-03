# Maintainer: Martan03 <martinslezak03@gmail.com>
pkgname=makeit
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line utility for creating and loading templates"
arch=(x86_64)
url="https://github.com/Martan03/makeit"
license=('GNU')
groups=()
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Martan03/makeit/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
    cargo build -r
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/makeit "$pkgdir/usr/bin/makeit"
    install -Dm644 useful/man-page/makeit.1 "$pkgdir/usr/share/man/man1/makeit.1"
}
