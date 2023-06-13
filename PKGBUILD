# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname='stagenda'
pkgver=1
pkgrel=1
pkgdesc="A simple command-line agenda written in C"
arch=('x86_64')
url="https://github.com/mxdixyz/stagenda"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mxdixyz/stagenda/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make
	install -Dm755 "./stagenda" "$pkgdir/usr/bin/stagenda"
	install -Dm644 "./stagenda.1" "$pkgdir/usr/share/man/man1/stagenda.1"
}