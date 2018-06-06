# Maintainer: Katie Wolfe <katie@dnaf.moe>
pkgname=fortune-mod-lemons-git
pkgver=r7.923c527
pkgrel=1
pkgdesc="Adds lemons and lemonauthors fortune files"
arch=('any')
url="https://gitlab.com/dnaf/lemon-fortunes"
license=('MIT')
groups=('fortune-mods')
depends=('fortune-mod')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://gitlab.com/dnaf/lemon-fortunes.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${srcdir}/lemon-fortunes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	strfile lemon-fortunes/lemons lemon-fortunes/lemons.dat
	strfile lemon-fortunes/lemonauthors lemon-fortunes/lemonauthors.dat
}

package() {
	install -D -m644 ${srcdir}/lemon-fortunes/lemons ${pkgdir}/usr/share/fortune/lemons
	install -D -m644 ${srcdir}/lemon-fortunes/lemons.dat ${pkgdir}/usr/share/fortune/lemons.dat
	install -D -m644 ${srcdir}/lemon-fortunes/lemonauthors ${pkgdir}/usr/share/fortune/lemonauthors
	install -D -m644 ${srcdir}/lemon-fortunes/lemonauthors.dat ${pkgdir}/usr/share/fortune/lemonauthors.dat
}
