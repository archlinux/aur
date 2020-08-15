# Maintainer: sp1rit <sp1ritCS@protonmail.com>
pkgname=dbus-codegen-rust
pkgver=0.5.0
pkgrel=1
pkgdesc="This program takes D-Bus XML Introspection data and generates Rust code for calling and implementing the interfaces in the introspection data."
arch=("any")
url="https://crates.io/crates/dbus-codegen/"
license=("Apache" "MIT")
depends=("dbus")
makedepends=("cargo")
provides=(dbus-codegen-rust)
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/tokio-rs/tokio/master/LICENSE")
noextract=("LICENSE")
md5sums=("448c359b06622c5317ee59a95e89731c")

build() {
	cargo install --root ./package --version $pkgver dbus-codegen
}

package() {	
	install -Dm755 ./package/bin/dbus-codegen-rust $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
