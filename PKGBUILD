# Maintainer: Gibbon <ad4m at outlook dot com>
pkgname=freelarn
pkgver=Xvart
pkgrel=1
pkgdesc="The officially maintained version of Larn that is developed by Gibbon"
arch=("i686" "x86_64")
license=('custom')
url="https://github.com/atsb/RL_M/releases/tag/Xvart"
makedepends=('git' 'ncurses' 'jsoncpp')
depends=('ncurses' 'jsoncpp')
source=('https://github.com/atsb/RL_M/releases/download/Xvart/RL_M-Xvart.tar.gz')
md5sums=('c2820e243af9bb73b62f5a93b0f5850b')

build() {
	cd "${srcdir}/RL_M-Xvart/build"
	make
}

package() {
	cd "${srcdir}/RL_M-Xvart"

	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 bin/freelarn ${pkgdir}/usr/bin/freelarn || return 1
	install -Dm644 README.md ${pkgdir}/usr/share/doc/freelarn/README.md || return 1
	install -Dm644 docs/CHANGELOG ${pkgdir}/usr/share/doc/freelarn/CHANGELOG || return 1
	install -Dm644 docs/LICENSE ${pkgdir}/usr/share/licenses/freelarn/LICENSE || return 1
	install -Dm644 docs/HISTORY ${pkgdir}/usr/share/doc/freelarn/HISTORY || return 1
	install -Dm644 bin/fl_config.json ${pkgdir}/usr/share/freelarn/fl_config.json
}

