# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
pkgname=qldv-git
pkgver=r8.665b5ee
pkgrel=1
pkgdesc="create a patched ld-linux.so without version information warnings"
arch=('i686' 'x86_64')
url=""
license=('BSD')
groups=()
depends=('lldb' 'coreutils' 'glibc' 'patchelf')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
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
