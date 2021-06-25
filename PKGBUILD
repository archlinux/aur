# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=lesbar-git
_pkgname=${pkgname%-git}
pkgver=0.4
pkgrel=1
pkgdesc="Markup language for status bars"
arch=('x86_64')
url="https://git.sr.ht/~salmiak/lesbar"
license=('MIT')
depends=('cairo'
         'glib2'
         'pango'
         'libx11')
makedepends=('scdoc')
source=("git+https://git.sr.ht/~salmiak/$_pkgname")
md5sums=("SKIP")

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" PREFIX="usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
