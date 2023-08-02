# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname='caur'
pkgver=1.0
pkgrel=1
pkgdesc="A simple AUR Helper written in C"
arch=('x86_64')
url="https://github.com/mxdixyz/caur"
license=('MIT')
depends=('glibc' 'libgit2')
makedepends=('gcc' 'git' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mxdixyz/caur/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	install -Dm755 "./caur" "$pkgdir/usr/bin/caur"
	install -Dm644 "./caur.1" "$pkgdir/usr/share/man/man1/caur.1"
}