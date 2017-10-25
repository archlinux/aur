# Maintainer: Nathan Ringo <remexre@gmail.com>
pkgname=oftlisp-std-git
pkgver=git20171024
pkgrel=1
pkgdesc="The OftLisp standard library."
arch=(arm arm64 i686 x86_64)
url="https://github.com/oftlisp/std.git"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('std::git+https://github.com/oftlisp/std.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/std"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/std"
	find . -name "*.oft" -exec install -DT {} "$pkgdir/usr/lib/oftlisp/src/std/{}" \;
}
