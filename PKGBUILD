# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>
pkgname='herbe-git'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Daemon-less notifications without D-Bus'
arch=('x86_64')
url='https://github.com/dudik/herbe'
license=('MIT')
depends=('libx11' 'libxft')
makedepends=('git')
provides=('herbe')
conflicts=('herbe')
source=("$pkgname-$pkgver::git+$url")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make clean all
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX='/usr' DESTDIR="$pkgdir/" install
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
