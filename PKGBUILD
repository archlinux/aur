# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=fbcat
pkgver=0.5.2
pkgrel=2
pkgdesc="Framebuffer screenshot tool"
arch=('x86_64' 'i686')
url="https://github.com/jwilk/fbcat"
license=("GPL2")
optdepends=('imagemagick' 'netpbm' 'graphicsmagick')
makedepends=('docbook-xsl')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('062ebd198814666bd1672ffadf2c820c344fc003d6e164ec968fac233b70061f'
            'SKIP')
validpgpkeys=('CDB5A1243ACDB63009AD07212D4EB3A6015475F5')

build() {
	cd "$pkgname-$pkgver"
	make
	(cd doc && make)
}

package() {
	cd "$pkgname-$pkgver"
	install -D fb{cat,grab} -t "$pkgdir/usr/bin/"
	install -D -m644 doc/fb{cat,grab}.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim:syntax=sh
