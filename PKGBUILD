# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=cp-p-git
pkgver=r19.2e97ba5
pkgrel=1
pkgdesc="cp (and mv), with progress"
arch=('any')
url="https://github.com/Naheel-Azawy/cp-p"
license=('GPL3')
depends=('strace')
makedepends=('git')
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+https://github.com/Naheel-Azawy/cp-p.git")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
