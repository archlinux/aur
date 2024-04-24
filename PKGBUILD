# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cjose
pkgver=0.6.2.3
pkgrel=1
pkgdesc='C library implementing the Javascript Object Signing and Encryption (JOSE)'
arch=(x86_64)
url="https://github.com/OpenIDC/$pkgname"
license=(MIT)
depends=(openssl
         jansson)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('2c5f930ddcb09be7db04ab6ffb679b20aa5f24f4fc26f47cc63bc01c19c9fe11')

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
