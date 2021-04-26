# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=epaste
pkgver=2.0.0
pkgrel=1
_dirname="$pkgname-v$pkgver"
pkgdesc="encrypts given text and turns encrypted bytes into base64 text which can be easily pasted/retrieved on pastebin websites"
arch=('i686' 'x86_64')
url="https://gitlab.com/zetok/epaste"
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
source=("${url}/-/archive/v${pkgver}/epaste-v${pkgver}.tar.gz")
noextract=()
sha512sums=('b1bc6e31043236e559119bd6e3fe2d5ad110e637e07e8c6a9945959cde40f8263d18286fd7373d91ca66797dda5313503412a99898d50aaea4ab94334d430f59')

build() {
	cd "$srcdir/$_dirname"
	cargo build --release
}

package() {
	cd "$srcdir/$_dirname"
	install -Dm755 "$srcdir/$_dirname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
