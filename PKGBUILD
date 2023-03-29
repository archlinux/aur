# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=typst-bin
pkgver=23_03_28
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/typst/typst/releases/download/v${pkgver//_/-}/typst-x86_64-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums=('ff9a538221fac5f7c1f1e2253929439f04e95213c78914da2eecc30c5e7c0d88')
validpgpkeys=()

package() {
	pushd "typst-x86_64-unknown-linux-gnu"
	install -Dm755 typst -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md NOTICE -t "$pkgdir/usr/share/doc/$pkgname/"
}

