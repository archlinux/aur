# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.15.7
pkgrel=2
pkgdesc='OpenID Connect Relying Party implementation for Apache 2.x'
arch=(x86_64)
url=https://www.mod-auth-openidc.org
license=(Apache)
depends=(apr-util cjose curl openssl pcre2)
_archive="$pkgname-$pkgver"
makedepends=(apache jansson)
source=("https://github.com/OpenIDC/$pkgname/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('a9f8b6f18ef4ccba20a802eb87af482a68153cb360cbf1010ce93855e127ccd0')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

