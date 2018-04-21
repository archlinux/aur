# Maintainer: Electrux <ElectruxRedsworth AT gmail DOT com>

pkgname=ccp4m
pkgver=0.5.3
pkgrel=1
pkgdesc="C++ project manager and build system"
arch=('any')
url="https://www.github.com/Electrux/CCP4M"
license=('BSD')
depends=('yaml-cpp' 'curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Electrux/$pkgname/archive/v$pkgver.tar.gz" )
md5sums=('7ef3e326e357289d15be685b2bfe665d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./build.sh
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 bin/ccp4m "$pkgdir/usr/bin/ccp4m"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
