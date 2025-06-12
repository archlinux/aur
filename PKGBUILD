# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cjose
pkgver=0.6.2.4
pkgrel=1
pkgdesc='C library implementing the Javascript Object Signing and Encryption (JOSE)'
arch=(x86_64)
url="https://github.com/OpenIDC/$pkgname"
license=(MIT)
depends=(openssl
         jansson)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('138f0115811c76e77632318115b7cf7b64da8bf0de5859c485af1259c6acc9e4')

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
