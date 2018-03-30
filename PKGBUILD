# Maintainer: Ignacio <nachohc89 at gmail dot com>
pkgname=lxc-templates
pkgver=3.0.0
pkgrel=2
pkgdesc="Old style template scripts for LXC"
arch=(any)
url="https://github.com/lxc/lxc-templates"
license=('GPL')
depends=('lxc' 'bash')
source=("https://github.com/lxc/lxc-templates/archive/$pkgname-$pkgver.tar.gz")
md5sums=('74970133f59325df1414df1e189f9246')

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
