# Maintainer: aksr <aksr at t-com dot me>
pkgname=rwc-git
pkgver=r15.ad239cf
pkgrel=1
pkgdesc='Report when files change'
arch=('i686' 'x86_64')
url='https://github.com/chneukirchen/rwc'
license=('Public Domain')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
