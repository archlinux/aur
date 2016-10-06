# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=minifortune
pkgver=2.5
pkgrel=1
pkgdesc="A minimal fortune-mod clone"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/vsergeev/minifortune"
license=('MIT')
depends=('glibc')
source=("git+https://github.com/vsergeev/minifortune.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make PREFIX="/usr"
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
	install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
