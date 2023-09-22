# Maintainer: Madison Lynch <madi@mxdi.xyz>
pkgname='stagenda'
pkgver=1
pkgrel=2
pkgdesc="A simple agenda program for *nix operating systems"
arch=('x86_64')
url="https://gitlab.com/deadgirl/stagenda"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'git' 'make')
source=("${pkgname}.tar.gz::https://gitlab.com/deadgirl/stagenda/-/archive/master/stagenda-master.tar.gz")
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-master"
	make
	install -Dm755 "./stagenda" "$pkgdir/usr/bin/stagenda"
	install -Dm644 "./stagenda.1" "$pkgdir/usr/share/man/man1/stagenda.1"
}