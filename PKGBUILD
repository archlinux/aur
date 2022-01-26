# Maintainer: alzeih <alzeih@users.noreply.github.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mod_auth_openidc
pkgver=2.4.11
pkgrel=1
pkgdesc="OpenID Connect Relying Party implementation for Apache 2.x"
arch=('x86_64')
url="https://www.mod-auth-openidc.org/"
license=('Apache')
depends=('curl' 'cjose' 'pcre')
makedepends=('apache' 'jansson')
source=("https://github.com/zmartzone/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9eed1257c308c0a6dd2ac3f5c7c997604f1f6b0ae855a7b094ac800f2e1ea90ad71fbaeecd99ec74d0e9cc2d67d1604710b3f06c13b63aa78b23dd1cb859a736')

build() {
        cd "$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}

