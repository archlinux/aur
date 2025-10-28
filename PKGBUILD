# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Maintainer: tee < teeaur at duck dot com >
pkgname=jnv-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Interactive JSON filter using jq"
arch=(x86_64)
url="https://github.com/ynqa/jnv"
license=(MIT)
provides=(jnv)
conflicts=(jnv)
depends=(
	gcc-libs
	glibc
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/jnv-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('02e8546c2936ab57de78199099288e67ed7926ebbad50e503e4502be5df7f3bf')

package() {
	find "$srcdir" -name "jnv" -print -exec install -Dm755 -t "$pkgdir/usr/bin" {} \;
	find "$srcdir" -name "LICENSE" -print -exec install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {} \;
}
