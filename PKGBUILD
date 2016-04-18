# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=epaste
pkgver=1.0.2
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
sha512sums=('3d26cbc95267008b75958ff9d54f972943f6f2c4a931cf7314b7eb7641a989fb6f07fa39c88c15724fc8b7f7bfd46cb4f76497ad8bb39ead143f29b3ae9bae97')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
