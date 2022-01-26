# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.11
pkgrel=2
pkgdesc='OpenID Connect Relying Party implementation for Apache 2.x'
arch=(x86_64)
url=https://www.mod-auth-openidc.org
license=(Apache)
depends=(cjose openssl pcre2)
_archive="$pkgname-$pkgver"
makedepends=(apache jansson)
source=("https://github.com/zmartzone/$pkgname/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('5140333b384c879bc7352badd9622e21fb46fdbf8ca6716423cb2d1e1ba0e2ac')

build() {
	cd "$_archive"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

