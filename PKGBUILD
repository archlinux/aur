# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=jnv-bin
pkgver=0.4.0
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
sha256sums=('0ba18b5f305548e9c41f3472ce2ef2aa56f49fed6da95c738aa16e8e51b78050')

package() {
	find $srcdir -name "jnv" -print -exec install -Dm755 -t "$pkgdir/usr/bin" {} \;

	find $srcdir -name "LICENSE" -print -exec install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {} \;
}
