# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cjose
pkgver=0.6.2.6
pkgrel=1
pkgdesc='C library implementing the Javascript Object Signing and Encryption (JOSE)'
arch=(x86_64)
url="https://github.com/OpenIDC/$pkgname"
license=(MIT)
depends=(openssl
         jansson)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('71614e6e0ed9e7619c3e36c0acfc59d8ded855b538568da536dd4de13d398d72')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
