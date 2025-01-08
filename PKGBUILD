# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=jnv-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Interactive JSON filter using jq"
arch=(x86_64)
url="https://github.com/ynqa/jnv"
license=(MIT)
depends=(
	gcc-libs
	glibc
)
source=("$pkgname-$pkgver.tar.xz::https://github.com/ynqa/jnv/releases/download/v$pkgver/jnv-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('14c6a3c8a985e107e8fbb7e014fac0d4e256df31c6f95c6cf004bdd0ea0f0dd3')

package() {
	find $srcdir -name "jnv" -print -exec install -Dm755 -t "$pkgdir/usr/bin" {} \;

	find $srcdir -name "LICENSE" -print -exec install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {} \;
}
