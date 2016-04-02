# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=postgresql-uint-git
pkgver=r72.378a440
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('i686' 'x86_64')
url="https://github.com/petere/pguint"
license=('unknown')
depends=('postgresql')
conflicts=('postgresql-uint')
provides=('postgresql-uint')
source=("$pkgname"::'git+https://github.com/petere/pguint')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
