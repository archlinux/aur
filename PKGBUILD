# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antony Male <antony dot male at gmail dot com>

pkgname=pacbuilder-git
pkgver=r135.6597966
pkgrel=1
pkgdesc="A tool to massively recompile archlinux packages from sources"
arch=('any')
url="https://github.com/arfoll/pacbuilder"
license=('GPL3')
provides=('pacbuilder' 'pacbuilder-svn')
conflicts=('pacbuilder-svn')
replaces=('pacbuilder-svn')
depends=('rsync' 'wget')
makedepends=('git')
backup=('etc/pacbuilder.conf')
source=("${pkgname}::git+https://github.com/arfoll/pacbuilder")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir" install
}
