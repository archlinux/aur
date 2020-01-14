# Maintainer: Ignacio <nachohc89 at gmail dot com>
pkgname=lxc-templates
pkgver=3.0.4
pkgrel=1
pkgdesc="Old style template scripts for LXC"
arch=(any)
url="https://github.com/lxc/lxc-templates"
license=('GPL')
depends=('lxc' 'bash')
source=("https://github.com/lxc/lxc-templates/archive/$pkgname-$pkgver.tar.gz")
md5sums=('2b592c8059da30769589682a6ab95f6a')
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
