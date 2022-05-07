# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.11.2
pkgrel=1
pkgdesc='OpenID Connect Relying Party implementation for Apache 2.x'
arch=(x86_64)
url=https://www.mod-auth-openidc.org
license=(Apache)
depends=(cjose openssl pcre2)
_archive="$pkgname-$pkgver"
makedepends=(apache jansson)
source=("https://github.com/zmartzone/$pkgname/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('cabab829dd71a4c1210606a02a5d9359d8c7687c63e212f35db84e3e98c4bd83')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

