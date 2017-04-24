# Maintainer: Erin Kinsley <ybden@ybden.com>

pkgname=manpager
pkgver=1.0.1
pkgrel=1
pkgdesc="colourize manpages"
arch=('i686' 'x86_64')
url="https://github.com/ybden/manpager/"
license=('custom: ISC')
depends=('less')
source=("https://github.com/ybden/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6998f3183b07221eead640aed4dec6a5f17c60b9d143f6c91a90b543c8b328f2')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" PREFIX=/usr make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
