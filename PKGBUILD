# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.20.1
pkgrel=1
pkgdesc='OpenID Connect Relying Party implementation for Apache 2.x'
arch=(x86_64)
url='https://www.mod-auth-openidc.org'
_url="https://github.com/OpenIDC/$pkgname/"
license=(Apache-2.0)
depends=(apr-util
         cjose
         curl
         openssl
         pcre2)
makedepends=(apache
             jansson)
_archive="$pkgname-$pkgver"
source=("$_url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('dabba0746ecb0953bf308b252f60f5aa749d90ad0344cf1d3070a94be8e190ac')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

