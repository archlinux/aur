# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=jnv-bin
pkgver=0.4.1
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
sha256sums=('82df03d2121c23609f54e8f11a3d48809768c9cfbd0a59c247a4447efe160ae4')

package() {
	find $srcdir -name "jnv" -print -exec install -Dm755 -t "$pkgdir/usr/bin" {} \;

	find $srcdir -name "LICENSE" -print -exec install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" {} \;
}
