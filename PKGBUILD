# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cjose
pkgver=0.6.2.8
pkgrel=1
pkgdesc='C library implementing the Javascript Object Signing and Encryption (JOSE)'
arch=(x86_64)
url="https://github.com/OpenIDC/$pkgname"
license=(MIT)
depends=(openssl
         jansson)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('eff840c865dec4e9cad78b519d23af256cf21e4bc4eca5992d3c52ede22e2a57')

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
