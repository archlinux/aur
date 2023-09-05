# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.14.3
pkgrel=1
pkgdesc='OpenID Connect Relying Party implementation for Apache 2.x'
arch=(x86_64)
url=https://www.mod-auth-openidc.org
license=(Apache)
depends=(apr-util cjose curl openssl pcre2)
_archive="$pkgname-$pkgver"
makedepends=(apache jansson)
source=("https://github.com/OpenIDC/$pkgname/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('ef5e30c76717b15db80de64c7f47cdcdd9d64458c0e39f3de4412269fc84c316')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

