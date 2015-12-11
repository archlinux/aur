# Maintainer: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=xfreq-git
pkgver=2.1.60
pkgrel=1
pkgdesc="Processor Monitoring w/ Turbo Boost, Temps, C-States, Features, Tasks scheduling"
arch=('x86_64')
url="http://github.com/cyring/xfreq/"
license=('GPL2')
makedepends=('git' 'libx11')
conflicts=('xfreq-2.0-git')
replaces=('xfreq-git')
source=("git+https://github.com/cyring/xfreq.git")
md5sums=('SKIP')
install=readme.install

_gitname=xfreq

build() {
	cd ${srcdir}/${_gitname}
	make -j 1
}

package() {
	cd ${srcdir}/${_gitname}
	install -Dm755 svr/bin/xfreq-intel "${pkgdir}/usr/bin/xfreq-intel"
	install -Dm644 svr/xfreq-intel.service "${pkgdir}/usr/lib/systemd/system/xfreq-intel.service"
	install -m755 cli/bin/xfreq-cli "${pkgdir}/usr/bin/xfreq-cli"
	install -m755 gui/bin/xfreq-gui "${pkgdir}/usr/bin/xfreq-gui"
}
