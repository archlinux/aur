# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pshash
pkgver=0.1.11.0
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
source=("Main.hs::https://raw.githubusercontent.com/thornoar/pshash/master/app/Main.hs"
	"README.md::https://raw.githubusercontent.com/thornoar/pshash/master/README.md"
	"LICENSE::https://raw.githubusercontent.com/thornoar/pshash/master/LICENSE")
noextract=("Main.hs")
validpgpkeys=()

build() {
	ghc ./Main.hs -no-keep-o-files -no-keep-hi-files -o ./pshash
}

package() {
	# cd "$pkgname-$pkgver"
	# make DESTDIR="$pkgdir/" install
	# echo "$pkgdir/"
	# mv ./pshash "$pkgdir/"
	
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('1653556de0f26d223348fb5bc61e9074dbbf8d61226d6885e9157be93f6089cc'
            '51bb38350ead1f2fc71169b932c95531d60f6133e8872bc582f4e5ec77dfe24c'
            '92e498dfdf4478c5d306c11af29b375797420464964efda7329d27a8025af6bb')
