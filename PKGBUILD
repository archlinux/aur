# This fork of cryptsetup made by Kriswebdev
# Archlinux package contributor is Dimadenisjuk <dimadenisjuk@yandex.ru>
pkgname=('cryptsetup-deluks')
pkgver=0.2BETA
pkgrel=1
epoch=
pkgdesc="Cryptsetup version with 'Deniable encryption' support"
arch=('any')
license=('GPL')
groups=()
depends=('device-mapper' 'libdevmapper.so' 'openssl' 'popt' 'libutil-linux'
	'libuuid.so' 'json-c' 'libjson-c.so' 'argon2' 'libargon2.so')
makedepends=('util-linux' 'git')
checkdepends=()
optdepends=()
provides=('cryptsetup' 'libcryptsetup.so=12-64' 'cryptsetup-deluks')
conflicts=('cryptsetup')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/kriswebdev/cryptsetup-deluks")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	bash ./autogen.sh
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
