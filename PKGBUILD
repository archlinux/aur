# Maintainer: Brian Steffens <briansteffens@gmail.com>
pkgname=now
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Common command translator for various Linux distributions"
arch=('i686' 'x86_64')
url="https://github.com/briansteffens/now"
license=('GPL')
groups=()
depends=()
makedepends=("python3")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-*}::git+https://github.com/briansteffens/now.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}"
    ./configure arch
    make
}

package() {
    cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
