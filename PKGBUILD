# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.19.1
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
sha256sums=('88d6434812bb65c16f704639af7ac13a7ecb0857ed59d36fe06e1c51970ca51d')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

