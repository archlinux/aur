# Maintainer: Gibbon
pkgname=freelarn
pkgver=LamaNobe
pkgrel=2
pkgdesc="The officially maintained version of Larn that is developed by Gibbon"
arch=("i686" "x86_64")
license=('Apache 2.0')
url="https://github.com/atsb/RL_M/releases/tag/FreeLarn-LamaNobe"
depends=('ncurses' 'jsoncpp')
source=('https://github.com/atsb/RL_M/releases/download/FreeLarn-LamaNobe/FreeLarn-LamaNobe.tar.gz')
md5sums=('92c3f1e558d7823ad881bd2b7ab84fe5')

build() {
	cd "${srcdir}/FreeLarn-LamaNobe/build"
	make -f Makefile.aur
}

package() {
	cd "${srcdir}/FreeLarn-LamaNobe"

	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 bin/freelarn ${pkgdir}/usr/bin/freelarn || return 1
	install -Dm644 README.md ${pkgdir}/usr/share/doc/freelarn/README.md || return 1
	install -Dm644 docs/CHANGELOG ${pkgdir}/usr/share/doc/freelarn/CHANGELOG || return 1
	install -Dm644 docs/LICENSE ${pkgdir}/usr/share/licenses/freelarn/LICENSE || return 1
	install -Dm644 docs/HISTORY ${pkgdir}/usr/share/doc/freelarn/HISTORY || return 1
	install -Dm644 bin/fl_config.json ${pkgdir}/usr/share/freelarn/fl_config.json || return 1
}

