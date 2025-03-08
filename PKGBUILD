# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=postgresql-libversion
pkgver=2.0.1
pkgrel=1
pkgdesc='PostgreSQL extension with support for version string comparison'
arch=('x86_64')
url='https://github.com/repology/postgresql-libversion'
license=('MIT')
depends=('libversion' 'postgresql')
makedepends=('postgresql-libs' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c586fc800d0eed98eeb31779c6a193b203557f93dacbfcecf7273b193d1e159348de7d50b56f5fcfaf97ad7a9fd092fe5d00c369c8b1b4c888cb0e59d24ed909')
b2sums=('78395aec89e849a8561a5bfabc0673b43c4577a3cb22d5ce966105052da89dddd792767fa2c01be9b971e5811d14423494e2e57e409718f0a2668941f1f81013')

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make \
    -C "$pkgname-$pkgver" \
    DESTDIR="$pkgdir" \
    install

  install -vDm644 "$pkgname-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
