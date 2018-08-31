# Maintainer: Electrux <ElectruxRedsworth AT gmail DOT com>

pkgname=ccp4m
pkgver=0.7.3
pkgrel=1
pkgdesc="C++ project manager and build system"
arch=('any')
url="https://www.github.com/Electrux/ccp4m"
license=('BSD')
depends=('yaml-cpp' 'curl')
source=("$pkgname-master.tar.gz::https://github.com/Electrux/$pkgname/archive/master.tar.gz" )
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-master"
	./build.sh
}

package() {
	cd "$srcdir/$pkgname-master"
	install -Dm755 bin/ccp4m "$pkgdir/usr/bin/ccp4m"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
