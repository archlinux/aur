# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=odict-bin
_pkgname="${pkgname%-bin}"
pkgver=2.7.0
pkgrel=1
pkgdesc="Lightning-fast dictionary file format and toolchain"
arch=('x86_64')
url="https://odict.org"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
_tarball_name="$_pkgname-cli-x86_64-unknown-linux-gnu"
source=("$_tarball_name-$pkgver.tar.xz::https://github.com/TheOpenDictionary/odict/releases/download/cli%2Fv$pkgver/$_tarball_name.tar.xz")
sha256sums=('30e064ff423934352a9aefab27c07cceb8525a68b411fa6bf5e69d86aa2d462b')

check() {
	cd "$_tarball_name"
	./odict --version
}

package() {
	cd "$_tarball_name"
	install -Dm0755 -t "$pkgdir/usr/bin" odict
	install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md CHANGELOG.md
}
