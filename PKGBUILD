# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=gdb-ctest-git
pkgrel=1
pkgver=rf5d8f00
license=('MIT')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc='Run ctest in gdb with fixtures and environment'
makedepends=('git')
url="https://github.com/syyyr/gdb-ctest"
source=("git+https://github.com/syyyr/gdb-ctest.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
