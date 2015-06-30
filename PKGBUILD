# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

pkgname=lua-llthreads2
pkgver=0.1.3
pkgrel=1
pkgdesc='This is full dropin replacement for llthreads library'
arch=('i686' 'x86_64')
url='http://github.com/moteus/lua-llthreads2/'
license=('MIT')
makedepends=('luarocks')
depends=('lua')
source=(https://github.com/moteus/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('66fdbf59ade16c2b53610dcb02bddfe6')

build() {
	cd $srcdir/$pkgname-$pkgver
	luarocks make --pack-binary-rock rockspecs/$pkgname-$pkgver-1.rockspec
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m755 llthreads2.so "$pkgdir"/usr/lib/lua/5.3/llthreads2.so
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
