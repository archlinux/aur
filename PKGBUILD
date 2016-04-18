# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=epaste
pkgver=1.0.0
pkgrel=1
pkgdesc="encrypts given text and turns encrypted bytes into base64 text which can be easily pasted/retrieved on pastebin websites"
arch=('i686' 'x86_64')
url="https://github.com/zetok/epaste"
license=('GPL3')
groups=()
depends=('gcc-libs' 'libsodium')
makedepends=('git' 'cargo')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/zetok/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=()
sha512sums=('c22f0499e2768946f82c9b60dda0928246795c1bfb716216f8f90c60cd34847a1b3bf500d9a2841f602de3be82b52986bdfd507de2b6800980685f1292e765d1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
