# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: solstiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=virt-v2v
pkgver=1.44.2
pkgrel=1
pkgdesc="Convert a guest image to use with KVM"
arch=(x86_64)
url="https://libguestfs.org/virt-v2v.1.html"
license=('GPL')
depends=('libguestfs' 'libosinfo')
makedepends=('ocaml' 'ocaml-findlib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://download.libguestfs.org/virt-v2v/${pkgver:0:4}-stable/virt-v2v-${pkgver}.tar.gz")
sha256sums=('c99ecabb93d1e6c81f0070b951e7bf42cee2a65a3ece387e01217f06080447fc')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
