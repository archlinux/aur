# Maintainer: Rose Kunkel <rose@rosekunkel.me>

pkgname=guile-hall
pkgver=0.3.1
pkgrel=1
pkgdesc='Project manager and build tool for GNU guile'
arch=('x86_64')
url='https://gitlab.com/a-sassmannshausen/guile-hall'
license=('GPL3')
depends=('git' 'guile' 'guile-config' 'texinfo')
optdepends=('guix: for GNU Guix integration')
source=("https://gitlab.com/a-sassmannshausen/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b8b1b7c9613217cb4df8ffe22a5e821c40cd5c9ce3de4ca6ad61fc9bb9e5f38e')

build() {
	cd "$pkgname-$pkgver"
    autoreconf -vif
    ./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
