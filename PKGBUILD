# Maintainer: spider-mario <spidermario@free.fr>
pkgname=moarvm
_pkgname=MoarVM
pkgver=2016.07
pkgrel=1
pkgdesc="Runtime built for the 6model object system."
arch=('i686' 'x86_64')
url="http://moarvm.com/"
license=(PerlArtistic)
depends=('glibc')
makedepends=('perl>=5.8')
options=('!makeflags')
source=("http://moarvm.com/releases/$_pkgname-$pkgver.tar.gz")
sha512sums=('9437b3156556b2363e039e00ab3bcbf3b2436b641bb52edfac16fcbf7d02db2b139a1426ac7d4e1c5387271634a6395160348da492e1be39364d9556af6fb20d')

build() {
	cd $_pkgname-$pkgver

	perl Configure.pl --prefix=/usr
	make
}
package() {
	cd $_pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}

