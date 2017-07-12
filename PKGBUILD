# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=epaste
pkgver=1.0.2
pkgrel=2
_commit=7eb82903bd207d4655a53c688148319b50cd5586
_dirname="$pkgname-v$pkgver-$_commit"
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
source=("$_dirname.tar.gz::${url}/repository/archive.tar.gz?ref=v${pkgver}")
noextract=()
sha512sums=('48131bfd87244a64c17ee83682d9d70ca676235052b651e5f47578dd1b476732bea8f7db43d50ea769a9434b07cae23d327620d683a6414119180203aa520c82')

build() {
	cd "$srcdir/$_dirname"
	cargo build --release
}

package() {
	cd "$srcdir/$_dirname"
	install -Dm755 "$srcdir/$_dirname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
