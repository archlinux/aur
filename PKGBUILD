# Maintainer: Ben Iofel <iofelben@gmail.com>

pkgname=vaccine-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A GTK+3 4chan client for the linux desktop"
arch=('any')
url="https://github.com/VaccineApp/vaccine"
license=('GPL3')
depends=('gtk3' 'libsoup' 'json-glib')
makedepends=('git' 'autoconf' 'automake' 'pkg-config' 'autoconf-archive' 'vala')
source=('vaccine::git+https://github.com/VaccineApp/vaccine.git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/vaccine"
        ./autogen.sh --prefix=/usr --disable-debug
	make
}

package() {
        cd vaccine
	make DESTDIR="$pkgdir/" install
}
