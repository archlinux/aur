# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=typst-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A new markup-based typesetting system that is powerful and easy to learn."
arch=('x86_64')
url="https://github.com/typst/typst"
license=('Apache')
groups=()
depends=(glibc gcc-libs)
makedepends=()
checkdepends=()
optdepends=()
provides=(typst)
conflicts=(typst typst-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/typst/releases/download/v$pkgver/typst-x86_64-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums=('590efbd05d45ce46a951f09b88cd69eb1d7013953f96c4fba1d7809778b956f5')
validpgpkeys=()

package() {
	pushd "typst-x86_64-unknown-linux-gnu"
	install -Dm755 typst -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md NOTICE -t "$pkgdir/usr/share/doc/$pkgname/"
}

