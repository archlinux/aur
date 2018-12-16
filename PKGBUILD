# Maintainer: Ignacio <nachohc89 at gmail dot com>
pkgname=lxc-templates
pkgver=3.0.3
pkgrel=1
pkgdesc="Old style template scripts for LXC"
arch=(any)
url="https://github.com/lxc/lxc-templates"
license=('GPL')
depends=('lxc' 'bash')
source=("https://github.com/lxc/lxc-templates/archive/$pkgname-$pkgver.tar.gz")
md5sums=('9cc16659a920b3c4b1490697a65ceb21')
options=(!emptydirs)

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgname-$pkgver"
	./configure --prefix=/usr --localstatedir=/var
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
