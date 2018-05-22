# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
pkgname=qldv-git
pkgver=r18.6b21389
pkgrel=1
pkgdesc="create a patched ld-linux.so without version information warnings"
arch=('i686' 'x86_64')
url=""
license=('BSD')
groups=()
depends=('binutils' 'coreutils' 'glibc' 'patchelf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('qldv::git+https://github.com/kirbyfan64/qldv')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install DESTDIR="$pkgdir" PREFIX="/usr"
}
