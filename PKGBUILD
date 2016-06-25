# Mantainer: Davide Berardi <berardi.dav@gmail.com>

pkgname=cado-git
_gitname=cado
pkgver=0.9
pkgrel=1

pkgdesc="Capability DO (like a sudo providing users with just the
capabilities they need))"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/rd235/cado"
license=('GPL')
makedepends=('autoconf' 'git')
depends=('libcap' 'pam')
provides=('cado' 'caprint')
conflicts=('cado' 'caprint')
source=("git://github.com/rd235/cado.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
}
