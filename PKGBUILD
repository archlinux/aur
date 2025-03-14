# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pshash
pkgver=0.1.14.5
pkgrel=1
epoch=
pkgdesc="A functional pseudo-hash password generator"
arch=('any')
url="https://github.com/thornoar/pshash"
license=('MIT')
groups=()
depends=()
makedepends=('ghc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("pshash-0.1.14.5.tar.gz::https://github.com/thornoar/pshash/archive/refs/tags/v0.1.14.5.tar.gz")
# source=("Main.hs::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/app/Main.hs"
# 	"README.md::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/README.md"
#	"LICENSE::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/LICENSE")
noextract=("Main.hs")
validpgpkeys=()

build() {
	tar -xvzf "pshash-0.1.14.5.tar.gz"
	cd "pshash-0.1.14.5"
	ghc --make -i./lib ./app/Main.hs -no-keep-o-files -no-keep-hi-files -o ./pshash
	cd ..
}

package() {
	cd "pshash-0.1.14.5"
	install -Dm755 ./pshash "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('d4e7fba9e5050c61d0b00386540fb82de1631d41efbb8db4d141c512e90a4e35')
